BEGIN {
    fn = strftime("data/食堂/%Y-%m-%d.txt");
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
        print "你好，"card[id]"！现在是北京时间"strftime("%Y年%m月%d日%H点%M分");
    } else if (id) {
        print id"不存在，请重新输入";
    }
    close(fn);
}
