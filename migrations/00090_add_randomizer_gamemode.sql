-- +goose Up
INSERT INTO match_type (id, name, description) VALUES (18, 'Randomizer', 'Random!');

ALTER TABLE `matches`
    ADD COLUMN `seed` VARCHAR(255) NULL;

-- +goose Down
ALTER TABLE `matches` DROP COLUMN `seed`;

DELETE FROM match_type WHERE id = 18;