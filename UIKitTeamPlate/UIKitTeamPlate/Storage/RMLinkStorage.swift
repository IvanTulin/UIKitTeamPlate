// RMLinkStorage.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Хранилище данных для заполнения ячеек ленты новостей
struct RMLinkStorage {
    let stories: [Stories] = [
        .init(
            avatarNameImage: "userAvatar",
            nameUser: "Ваша история",
            isHiddenButtons: false
        ),
        .init(
            avatarNameImage: "blondeGirlImage",
            nameUser: "lavanda123",
            isHiddenButtons: true
        ),
        .init(
            avatarNameImage: "blondeGirlImage",
            nameUser: "lavanda123",
            isHiddenButtons: true
        ),
        .init(
            avatarNameImage: "blondeGirlImage",
            nameUser: "lavanda123",
            isHiddenButtons: true
        ),
        .init(
            avatarNameImage: "blondeGirlImage",
            nameUser: "lavanda123",
            isHiddenButtons: true
        ),
        .init(
            avatarNameImage: "blondeGirlImage",
            nameUser: "lavanda123",
            isHiddenButtons: true
        ),
        .init(
            avatarNameImage: "blondeGirlImage",
            nameUser: "lavanda123",
            isHiddenButtons: true
        ),
        .init(
            avatarNameImage: "blondeGirlImage",
            nameUser: "lavanda123",
            isHiddenButtons: true
        ),
        .init(
            avatarNameImage: "blondeGirlImage",
            nameUser: "lavanda123",
            isHiddenButtons: true
        ),
        .init(
            avatarNameImage: "blondeGirlImage",
            nameUser: "lavanda123",
            isHiddenButtons: true
        ),
    ]

    let posts: [Post] = [
        .init(
            avatarImageName: "avatarImage",
            nameTitle: "tur_v_dagestan",
            postImageNames: ["postNameImageOne"],
            numberLikeText: "Нравится: 201",
            isLikePressedButton: true,
            comment: CommentShortInfo(
                userName: "tur_v_dagestan ",
                commentText: "Насладитесь красотой природы. Забронировать тур в Дагестан можно уже сейчас!"
            ),
            nameImageForCommentUser: "brunetteGirlImage",
            userCommentText: "Комментировать ...",
            postDescription: "10 минут назад"
        ),
        .init(
            avatarImageName: "avatarImage",
            nameTitle: "tur_v_dagestan",
            postImageNames: ["imageForPagecontrolTwo"],
            numberLikeText: "Нравится: 201",
            isLikePressedButton: true,
            comment: CommentShortInfo(
                userName: "tur_v_dagestan ",
                commentText: "Насладитесь красотой природы. Забронировать тур в Дагестан можно уже сейчас!"
            ),
            nameImageForCommentUser: "brunetteGirlImage",
            userCommentText: "Комментировать ...",
            postDescription: "10 минут назад"
        ),
        .init(
            avatarImageName: "avatarImage",
            nameTitle: "tur_v_dagestan",
            postImageNames: ["castleImage"],
            numberLikeText: "Нравится: 201",
            isLikePressedButton: true,
            comment: CommentShortInfo(
                userName: "tur_v_dagestan ",
                commentText: "Насладитесь красотой природы. Забронировать тур в Дагестан можно уже сейчас!"
            ),
            nameImageForCommentUser: "brunetteGirlImage",
            userCommentText: "Комментировать ...",
            postDescription: "10 минут назад"
        ),
        .init(
            avatarImageName: "avatarImage",
            nameTitle: "tur_v_dagestan",
            postImageNames: ["postNameImageOne"],
            numberLikeText: "Нравится: 201",
            isLikePressedButton: true,
            comment: CommentShortInfo(
                userName: "tur_v_dagestan ",
                commentText: "Насладитесь красотой природы. Забронировать тур в Дагестан можно уже сейчас!"
            ),
            nameImageForCommentUser: "brunetteGirlImage",
            userCommentText: "Комментировать ...",
            postDescription: "10 минут назад"
        ),
    ]

    let recommendations = [
        Recommendations(
            avatarNameImage: "castleImage",
            userName: "сrimea_082"
        ),
        Recommendations(
            avatarNameImage: "maryPolImage",
            userName: "mary_pol"
        ),
        Recommendations(
            avatarNameImage: "blondeGirlImage",
            userName: "lavarel99"
        ),
    ]
}

/// Cторис
struct Stories {
    /// название картинки для аватарки
    let avatarNameImage: String
    /// имя пользователя
    let nameUser: String
    /// проверка на скрытность кнопки
    let isHiddenButtons: Bool
}

/// Пост пользователя
struct Post {
    /// название картинки для аватарки
    let avatarImageName: String
    /// название титла
    let nameTitle: String
    /// название картинки для поста
    let postImageNames: [String]
    /// лейбл с лайками
    let numberLikeText: String
    /// проверка нажата ли кнопка
    let isLikePressedButton: Bool
    /// комментарий
    let comment: CommentShortInfo?
    /// название картинки для аватарки в комментариях
    let nameImageForCommentUser: String
    /// текст пользователя для комментариев
    let userCommentText: String
    /// текст - когда был в сети
    let postDescription: String
}

/// Рекомендации
struct Recommendations {
    /// название картинки для аватарки
    let avatarNameImage: String
    /// имя пользователя
    let userName: String
}

/// Комментарий
struct CommentShortInfo {
    /// имя пользователя
    let userName: String
    /// тест комментария
    let commentText: String
}
