BEGIN {
    fn = strftime("data/��ʱ/%Y-%m-%d.txt");
}

FILENAME != "-" {
    for (i = 2; i <= NF; i++) {
        id = sprintf("%d", $i);
        card[id] = $1;
    }
}

FILENAME == "-" {
    id = $1;
    if (id in card) {
        print card[id]" "systime() >> fn;
        print "��ã�"card[id]"��";
    } else if (id) {
        print id"�����ڣ�����������";
    }
    close(fn);
}
