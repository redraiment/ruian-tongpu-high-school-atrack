BEGIN {
    fn = strftime("data/ʳ��/%Y-%m-%d.txt");
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
        print card[id] >> fn;
        print "��ã�"card[id]"�������Ǳ���ʱ��"strftime("%Y��%m��%d��%H��%M��");
    } else if (id) {
        print id"�����ڣ�����������";
    }
    close(fn);
}
