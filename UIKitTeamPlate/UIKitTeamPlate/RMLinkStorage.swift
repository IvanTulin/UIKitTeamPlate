// RMLinkStorage.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Хранилище данных для заполнения всех ячеек
struct RMLinkStorage {
    let stories: [Stories] = [
        .init(avatarNameImage: "blondeGirlImage", nameUser: "lavanda123"),
        .init(avatarNameImage: "blondeGirlImage", nameUser: "lavanda123"),
        .init(avatarNameImage: "blondeGirlImage", nameUser: "lavanda123"),
        .init(avatarNameImage: "blondeGirlImage", nameUser: "lavanda123"),
        .init(avatarNameImage: "blondeGirlImage", nameUser: "lavanda123"),
        .init(avatarNameImage: "blondeGirlImage", nameUser: "lavanda123"),
        .init(avatarNameImage: "blondeGirlImage", nameUser: "lavanda123"),
        .init(avatarNameImage: "blondeGirlImage", nameUser: "lavanda123"),
        .init(avatarNameImage: "blondeGirlImage", nameUser: "lavanda123"),
        .init(avatarNameImage: "blondeGirlImage", nameUser: "lavanda123"),
        .init(avatarNameImage: "blondeGirlImage", nameUser: "lavanda123"),
        .init(avatarNameImage: "blondeGirlImage", nameUser: "lavanda123"),
        .init(avatarNameImage: "blondeGirlImage", nameUser: "lavanda123"),
        .init(avatarNameImage: "blondeGirlImage", nameUser: "lavanda123"),
        .init(avatarNameImage: "blondeGirlImage", nameUser: "lavanda123"),
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
}

/// Данные для сторис
struct Stories {
    let avatarNameImage: String
    let nameUser: String
}

/// Данные для поста
struct Post {
    let avatarNameImage: String
    let nameTitle: String
    let postNameImages: [String]
    let numberLike: String
    let isLikePressedButton: Bool
    let comment: CommentShortInfo?
    let nameImageForCommentUser: String
    let textForUserComment: String
    let descriptionPost: String
}

/// Данные для комментария
struct CommentShortInfo {
    let userName: String
    let commentText: String
}
