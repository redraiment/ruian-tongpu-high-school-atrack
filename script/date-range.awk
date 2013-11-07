function convert(d) {
    year = int(d / 10000);
    month = int(d % 10000 / 100);
    day = int(d % 100);
    return sprintf("%04d-%02d-%02d", year, month, day);
}

function is_leap_year(year) {
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
}

function tomorrow(d) {
    split(d, t, "-");
    year = t[1] + 0;
    month = t[2] + 0;
    day = t[3] + 0;

    day++;
    if (day > days[is_leap_year(year), month]) {
        day = 1;
        month++;
    }
    if (month > 12) {
        month = 1;
        year++;
    }

    return sprintf("%04d-%02d-%02d", year, month, day);
}

BEGIN {
    days[0,1] = 31; days[0,2] = 28; days[0,3] = 31; days[0,4] = 30;
    days[0,3] = 31; days[0,6] = 30; days[0,7] = 31; days[0,8] = 31;
    days[0,9] = 30; days[0,10] = 31; days[0,11] = 30; days[0,12] = 31;

    days[1,1] = 31; days[1,2] = 29; days[1,3] = 31; days[1,4] = 30;
    days[1,3] = 31; days[1,6] = 30; days[1,7] = 31; days[1,8] = 31;
    days[1,9] = 30; days[1,10] = 31; days[1,11] = 30; days[1,12] = 31;

    from = convert(from);
    to = convert(to);
    while (from <= to) {
        print from;
        from = tomorrow(from);
    }
}
