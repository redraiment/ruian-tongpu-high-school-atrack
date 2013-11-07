BEGIN {
    printf("%-8s %s\n", "����", "�ܹ�ʱ(Сʱ)");
}

FNR == 1 {
    delete today;
}

FILENAME != "data\\employee.txt" {
    if (today[$1]) {
        total[$1] += ($2 - today[$1]) / 3600.0;
    }
    today[$1] = $2;
}

END {
    for (name in total) {
        printf("%-8s %f\n", name, total[name]);
    }
}
