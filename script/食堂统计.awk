function statistics() {
    amount = 150.0;
    if (count > 0) {
        for (i = 0; i < count; i++) {
            total[employee[i]] += amount / count;
        }
        count = 0;
    }
}

BEGIN {
    count = 0;

    printf("%-8s %s\n", "ÐÕÃû", "²¹Ìù(Ôª)");
}

FNR == 1 {
    statistics();
}

{
    employee[count] = $0;
    count++;
}

END {
    statistics();

    for (name in total) {
        printf("%-8s %f\n", name, total[name]);
    }
}
