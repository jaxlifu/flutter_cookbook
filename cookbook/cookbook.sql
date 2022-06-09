-- SQLite
-- .databases
/*查看当前表*/
-- .tables
/*创建动物表，并添加数据*/
DROP TABLE IF EXISTS animal;

CREATE TABLE IF NOT EXISTS animal(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    hobby TEXT NOT NULL
);

-- .schema
INSERT INTO animal (name, hobby)
VALUES ('猫', '吃鱼');

INSERT INTO animal (name, hobby)
VALUES ('狗', '吃骨头');

INSERT INTO animal (name, hobby)
VALUES ('狼', '吃肉');

INSERT INTO animal (name, hobby)
VALUES ('猴子', '吃香蕉');

INSERT INTO animal (name, hobby)
VALUES ('男人', '看美女');

INSERT INTO animal (name, hobby)
VALUES ('小孩', '哭');

INSERT INTO animal (name, hobby)
VALUES ('鸡', '打鸣');

INSERT INTO animal (name, hobby)
VALUES ('青龙', '收藏珠宝');

INSERT INTO animal (name, hobby)
VALUES ('朱雀', '玩火');

INSERT INTO animal (name, hobby)
VALUES ('玄武', '睡觉');

INSERT INTO animal (name, hobby)
VALUES ('白虎', '打架');

INSERT INTO animal (name, hobby)
VALUES ('刺猬', 12);

SELECT *
FROM animal;

/*创建狗狗表，并添加数据*/
DROP TABLE IF EXISTS dogs;

CREATE TABLE IF NOT EXISTS dogs(
    id integer PRIMARY KEY autoincrement,
    name TEXT,
    age integer
);

INSERT INTO dogs(name, age)
VALUES ('哈士奇', 1);

INSERT INTO dogs(name, age)
VALUES ('柴犬', 1);

INSERT INTO dogs(name, age)
VALUES ('拉布拉多', 1);

INSERT INTO dogs(name, age)
VALUES ('金毛', 1);

INSERT INTO dogs(name, age)
VALUES ('博美', 1);

INSERT INTO dogs (id, name, age)
VALUES (199, '小七', 21);

UPDATE dogs
SET name = '飞虎'
WHERE id = 199;

SELECT *
FROM dogs
WHERE id;