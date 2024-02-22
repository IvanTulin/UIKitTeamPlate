// ProfileStorage.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Хранилище данных для профиля
struct ProfileStorage {
    let userStories: [UserStories] = [
        UserStories(
            nameStoriesImageView: "startImage", nameTextLabel: "Запуск"
        ),
        UserStories(
            nameStoriesImageView: "moonImage", nameTextLabel: "Луна"
        ),
        UserStories(
            nameStoriesImageView: "astronautImage",
            nameTextLabel: "Космона..."
        ),
        UserStories(
            nameStoriesImageView: "spaceImage", nameTextLabel: "Космос"
        ),
        UserStories(
            nameStoriesImageView: "startImage", nameTextLabel: "Запуск"
        ),
        UserStories(
            nameStoriesImageView: "moonImage", nameTextLabel: "Луна"
        ),
        UserStories(
            nameStoriesImageView: "astronautImage",
            nameTextLabel: "Космона..."
        ),
    ]
    let userPosts: [UserPosts] = [
        UserPosts(nameImages: "postImageOne"),
        UserPosts(nameImages: "postImageTwo"),
        UserPosts(nameImages: "postImageThree"),
        UserPosts(nameImages: "postImageFour"),
        UserPosts(nameImages: "postImageOne"),
        UserPosts(nameImages: "postImageTwo"),
        UserPosts(nameImages: "postImageThree"),
        UserPosts(nameImages: "postImageFour"),
        UserPosts(nameImages: "postImageOne"),
        UserPosts(nameImages: "postImageTwo"),
        UserPosts(nameImages: "postImageThree"),
        UserPosts(nameImages: "postImageFour"),
    ]
}

/// Данные сторис пользователя
struct UserStories {
    let nameStoriesImageView: String
    let nameTextLabel: String
}

/// Данные постов пользователя
struct UserPosts {
    let nameImages: String
}
