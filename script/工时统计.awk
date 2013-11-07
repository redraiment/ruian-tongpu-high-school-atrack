BEGIN {
    printf("%-8s %s\n", "姓名", "总工时(小时)");
}

FILENAME == "data\\employee.txt" {
    for (i = 2; i <= NF; i++) {
        id = sprintf("%d", $i);
        card[id] = $1;
    }
    total[$1] = 0
}

FILENAME != "data\\employee.txt" && FNR == 1 {
    for (name in total) {
        today[name] = 0;
    }
}

FILENAME != "data\\employee.txt" && $1 in today {
    if (today[$1]) {
        total[$1] += ($2 - today[$1]) / 3600.0;
        today[$1] = 0;
    } else {
        today[$1] = $2;
    }
}

END {
    for (name in total) {
        printf("%-8s %f\n", name, total[name]);
    }
}
