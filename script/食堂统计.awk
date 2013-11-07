function statistics() {
    amount = 150.0;
    if (count > 0) {
        for (name in employee) {
            total[name] += amount / count;
        }
        count = 0;
    }
    delete employee;
}

BEGIN {
    count = 0;
    printf("%-8s %s\n", "ÐÕÃû", "²¹Ìù(Ôª)");
}

FNR == 1 {
    statistics();
}

! employee[$1] {
    employee[$1] = 1;
    count++;
}

END {
    statistics();

    for (name in total) {
        printf("%-8s %f\n", name, total[name]);
    }
}
