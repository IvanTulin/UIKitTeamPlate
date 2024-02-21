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
            avatarNameImage: "avatarImage",
            nameTitle: "tur_v_dagestan",
            postNameImages: ["postNameImageOne"],
            numberLike: "Нравится: 201",
            isLikePressedButton: true,
            comment: CommentShortInfo(
                userName: "tur_v_dagestan ",
                commentText: "Насладитесь красотой природы. Забронировать тур в Дагестан можно уже сейчас!"
            ),
            nameImageForCommentUser: "brunetteGirlImage",
            textForUserComment: "Комментировать ...",
            descriptionPost: "10 минут назад"
        ),
        .init(
            avatarNameImage: "avatarImage",
            nameTitle: "tur_v_dagestan",
            postNameImages: ["imageForPagecontrolTwo"],
            numberLike: "Нравится: 201",
            isLikePressedButton: true,
            comment: CommentShortInfo(
                userName: "tur_v_dagestan ",
                commentText: "Насладитесь красотой природы. Забронировать тур в Дагестан можно уже сейчас!"
            ),
            nameImageForCommentUser: "brunetteGirlImage",
            textForUserComment: "Комментировать ...",
            descriptionPost: "10 минут назад"
        ),
        .init(
            avatarNameImage: "avatarImage",
            nameTitle: "tur_v_dagestan",
            postNameImages: ["castleImage"],
            numberLike: "Нравится: 201",
            isLikePressedButton: true,
            comment: CommentShortInfo(
                userName: "tur_v_dagestan ",
                commentText: "Насладитесь красотой природы. Забронировать тур в Дагестан можно уже сейчас!"
            ),
            nameImageForCommentUser: "brunetteGirlImage",
            textForUserComment: "Комментировать ...",
            descriptionPost: "10 минут назад"
        ),
        .init(
            avatarNameImage: "avatarImage",
            nameTitle: "tur_v_dagestan",
            postNameImages: ["postNameImageOne"],
            numberLike: "Нравится: 201",
            isLikePressedButton: true,
            comment: CommentShortInfo(
                userName: "tur_v_dagestan ",
                commentText: "Насладитесь красотой природы. Забронировать тур в Дагестан можно уже сейчас!"
            ),
            nameImageForCommentUser: "brunetteGirlImage",
            textForUserComment: "Комментировать ...",
            descriptionPost: "10 минут назад"
        ),
    ]

    let recommendations = [
        Recommendations(
            avatarNameImage: "castleImage",
            nameUser: "сrimea_082"
        ),
        Recommendations(
            avatarNameImage: "maryPolImage",
            nameUser: "mary_pol"
        ),
        Recommendations(
            avatarNameImage: "blondeGirlImage",
            nameUser: "lavarel99"
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

/// Поста
struct Post {
    /// название картинки для аватарки
    let avatarNameImage: String
    /// название титла
    let nameTitle: String
    /// название картинки для поста
    let postNameImages: [String]
    /// лейбл с лайками
    let numberLike: String
    /// проверка нажата ли кнопка
    let isLikePressedButton: Bool
    /// комментраий
    let comment: CommentShortInfo?
    /// название картинки для аватарки в комментариях
    let nameImageForCommentUser: String
    /// текст пользователя для комментариев
    let textForUserComment: String
    /// текст - когда был в сети
    let descriptionPost: String
}

/// Рекомендации
struct Recommendations {
    /// название картинки для аватарки
    let avatarNameImage: String
    /// имя пользователя
    let nameUser: String
}

/// Комментарий
struct CommentShortInfo {
    /// имя пользователя
    let userName: String
    /// тест комментария
    let commentText: String
}
