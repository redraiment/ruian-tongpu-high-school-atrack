BEGIN {
    fn = strftime("data/工时/%Y-%m-%d.txt");
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
        print "你好，"card[id]"！";
    } else if (id) {
        print id"不存在，请重新输入";
    }
    close(fn);
}
