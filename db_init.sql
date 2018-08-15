DROP TABLE IF EXISTS sample

CREATE TABLE sample (
    id          INTEGER NOT NULL,
    name        VARCHAR(100) NOT NULL,
    age         INTEGER,
    password    VARCHAR(20),
    PRIMARY KEY (id)
);

INSERT INTO sample
VALUES
    (1, '山田太郎', 26, 'yamada'),
    (2, '佐藤隆', 34, 'sato'),
    (3, '斎藤達弘', 45, 'saito'),
    (4, '桜井さつき', 28, 'sakurai');