CREATE TABLE `users` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `user_password` VARCHAR(20) NOT NULL,
    `nick_name` VARCHAR(20) NOT NULL,
    `profile_pic_link` VARCHAR(100) NOT NULL,
    `status_message` VARCHAR(100) NOT NULL,
    `is_unregister` TINYINT NOT NULL DEFAULT 0,
    `register_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `channels` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `channel_name` VARCHAR(20) NOT NULL,
    `channel_create_id` INT NOT NULL,
    `channel_link` VARCHAR(100) NOT NULL,
    `capacity` TINYINT NOT NULL,
    `is_unregister` TINYINT NOT NULL DEFAULT 0,
    `create_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`channel_create_id`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `chats` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `chat_contents` VARCHAR(300) NOT NULL,
    `chat_create_id` INT NOT NULL,
    `channel_id` INT NOT NULL,
    `create_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`chat_create_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`channel_id`) REFERENCES `channels`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `blocks` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `block_id` INT NOT NULL,
    `blocked_id` INT NOT NULL,
    `block_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`block_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`blocked_id`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `follows` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `follower_id` INT NOT NULL,
    `followee_id` INT NOT NULL,
    `follow_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`follower_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`followee_id`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;