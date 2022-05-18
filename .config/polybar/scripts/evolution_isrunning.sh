#!/usr/bin/env bash
process="evolution"

case "$(pidof $process | wc -w)" in
    0)
        echo ""
        ;;
    *)
        echo " "
        ;;
esac
