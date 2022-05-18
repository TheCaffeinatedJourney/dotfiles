#!/usr/bin/env bash
process="vmware-view"

case "$(pidof $process | wc -w)" in
    0)
        echo ""
        ;;
    *)
        echo " "
        ;;
esac
