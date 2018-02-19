#!/bin/bash

export BASE_DIR="`dirname $0`"
if test -z "$BUILD_DIR"; then
  BUILD_DIR="$BASE_DIR"
fi
export BUILD_DIR

top_dir="$BUILD_DIR/../.."
top_dir=$(cd -P "$top_dir" 2>/dev/null || cd "$top_dir"; pwd)

n_processors=1
case `uname` in
  Linux)
    n_processors="$(grep '^processor' /proc/cpuinfo | wc -l)"
    ;;
  Darwin)
    n_processors="$(/usr/sbin/sysctl -n hw.ncpu)"
    ;;
  *)
    :
    ;;
esac

if test x"$NO_MAKE" != x"yes"; then
  MAKE_ARGS=
  if test $n_processors -gt 1; then
    MAKE_ARGS="${MAKE_ARGS} -j${n_processors}"
  fi
  make -C $top_dir ${MAKE_ARGS} > /dev/null || exit 1
fi

. "${top_dir}/config.sh"

GRN_PLUGINS_DIR="$top_dir/plugins"
export GRN_PLUGINS_DIR

GRN_RUBY_SCRIPTS_DIR="$top_dir/lib/mrb/scripts"
export GRN_RUBY_SCRIPTS_DIR

case `uname` in
  Linux|*BSD)
    LD_LIBRARY_PATH="$top_dir/lib/.libs:$LD_LIBRARY_PATH"
    export LD_LIBRARY_PATH
    ;;
  Darwin)
    DYLD_LIBRARY_PATH="$top_dir/lib/.libs:$DYLD_LIBRARY_PATH"
    export DYLD_LIBRARY_PATH
    ;;
  *)
    :
    ;;
esac

if test -z "$RUBY"; then
  exit 1
fi

if ! type bundle > /dev/null; then
  $RUBY -S gem install bundler
fi

grntest_dir="$BASE_DIR/grntest"
if ! test -d "$grntest_dir"; then
  git clone --depth 1 git://github.com/groonga/grntest.git "$grntest_dir"
  (cd "$grntest_dir" && bundle install)
else
  BUNDLE_GEMFILE="$grntest_dir/Gemfile"
  export BUNDLE_GEMFILE
  if [ "$BUNDLE_GEMFILE" -nt "$BUNDLE_GEMFILE.lock" ]; then
    $RUBY -S bundle update
  fi
fi

groonga_command_dir="$BASE_DIR/groonga-command"
if ! test -d "$groonga_command_dir"; then
  git clone --depth 1 \
      git://github.com/groonga/groonga-command "$groonga_command_dir"
fi

groonga_command_parser_dir="$BASE_DIR/groonga-command-parser"
if ! test -d "$groonga_command_parser_dir"; then
  git clone --depth 1 \
      git://github.com/groonga/groonga-command-parser \
      "$groonga_command_parser_dir"
fi

have_targets="false"
use_gdb="false"
use_valgrind="false"
next_argument_is_long_option_value="false"
for argument in "$@"; do
  case "$argument" in
    --*=*)
      ;;
    --keep-database|--no-*|--version|--help)
      # no argument options
      ;;
    --gdb)
      # no argument options
      use_gdb="true"
      ;;
    --valgrind)
      # no argument options
      use_valgrind="true"
      ;;
    --*)
      next_argument_is_long_option_value="true"
      continue
      ;;
    -*)
      ;;
    *)
      if test "$next_argument_is_long_option_value" != "true"; then
        have_targets="true"
      fi
      ;;
  esac
  next_argument_is_long_option_value="false"
done

grntest_options=("$@")
if test "$use_gdb" = "true" -o "$use_valgrind" = "true"; then
  grntest_options=("--reporter" "stream" "${grntest_options[@]}")
else
  grntest_options=("--n-workers" "${n_processors}" "${grntest_options[@]}")
fi
if test "$CI" = "true"; then
  grntest_options=("--reporter" "mark" "${grntest_options[@]}")
fi
if test "$have_targets" != "true"; then
  grntest_options=("${grntest_options[@]}" "${BASE_DIR}/suite")
fi

tmpfs_candidates=("/dev/shm" "/run/shm")
for tmpfs in "${tmpfs_candidates[@]}"; do
  if test -d $tmpfs -a -w $tmpfs; then
    rm -rf "tmp"
    ln -s $tmpfs "tmp"
  fi
done

export TZ=Asia/Tokyo

$RUBY \
  -I "$grntest_dir/lib" \
  -I "$groonga_command_dir/lib" \
  -I "$groonga_command_parser_dir/lib" \
  "$grntest_dir/bin/grntest" \
  --groonga "$GROONGA" \
  --groonga-httpd "$GROONGA_HTTPD" \
  --groonga-suggest-create-dataset "$GROONGA_SUGGEST_CREATE_DATASET" \
  --base-directory "$BASE_DIR" \
  "${grntest_options[@]}"
