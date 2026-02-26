-- +goose Up
INSERT INTO match_type (id, name) VALUES (18, 'Randomizer');

ALTER TABLE `matches`
    ADD COLUMN `seed` VARCHAR(255) NULL;

-- +goose Down
ALTER TABLE `matches` DROP COLUMN `seed`;

DELETE FROM match_type WHERE id = 18;