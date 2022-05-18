#!/usr/bin/env bash

case "$(ps -ef|grep -e "python3.*jigglemethis.py" | grep -v grep | wc -w)" in
    0)
        # jigglemethis is not running
        echo "﯈ "
        ;;
    *)
        # jigglemethis is running
        echo " "
        ;;
esac

