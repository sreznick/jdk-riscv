#!/bin/bash

OPTIND=1

variant=core
level=slowdebug

while getopts "hv:l:" opt; do
    case "$opt" in
    h)
        echo "usage: $0 [-h] [-v variant] [-l debug-level]"
        echo "       -h show help"
        echo "       -v choose jvm-variant (server, client, minimal, core, zero, zeroshark, custom). default is core"
        echo "       -l choose debug level (release, fastdebug, slowdebug, optimized). default is release"
        exit 0
        ;;
    v)  variant=$OPTARG
        ;;
    l)  level=$OPTARG
        ;;
    esac
done

QEMU_GDB=12345 /jdk-riscv/build/linux-riscv64-$variant-$level/jdk/bin/java -XX:+BreakAtStartup
