// NotificationStorage.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Хранилище данных для заполнения ячеек уведомлений
struct NotificationStorage {
    let notificationToday: [NotificationToday] = [
        .init(
            avatarNameImage: "blondeGirlImage",
            notificationLabel: CommentShortInfo(
                userName: "lavanda123",
                commentText: #" понравился ваш комментарий: "Очень красиво!" "#
            ),
            nameForPostImage: "imageForTodayPost"
        ),
        .init(
            avatarNameImage: "blondeGirlImage",
            notificationLabel: CommentShortInfo(
                userName: "lavanda123",
                commentText: " упомянул(-а) вас в комментарии: @rm Спасибо! "
            ),
            nameForPostImage: "imageForTodayPost"
        ),
    ]
    let notificationThisWeek: [NotificationThisWeek] = [
        .init(
            avatarNameImage: "blondeGirlImage",
            notificationLabel: CommentShortInfo(
                userName: "lavanda123",
                commentText: #" понравился ваш комментарий: "Это где?" "#
            ),
            textForTitleButton: nil,
            isHiddenButton: true,
            nameForPostImage: "museumImage",
            isHiddenPostImage: false
        ),
        .init(
            avatarNameImage: "avatarImageMiho",
            notificationLabel: CommentShortInfo(
                userName: "12miho",
                commentText: " появился(-ась)\n в RMLink. Вы можете\n быть знакомы "
            ),
            textForTitleButton: "Подписаться",
            isHiddenButton: false,
            nameForPostImage: nil,
            isHiddenPostImage: true
        ),
        .init(
            avatarNameImage: "blondeGirlImage",
            notificationLabel: CommentShortInfo(
                userName: "lavanda123\n",
                commentText: "подписался(-ась) на\n ваши новости  "
            ),
            textForTitleButton: "Вы подписаны",
            isHiddenButton: false,
            nameForPostImage: nil,
            isHiddenPostImage: true
        ),
        .init(
            avatarNameImage: "blondeGirlImage",
            notificationLabel: CommentShortInfo(
                userName: "lavanda123",
                commentText: #" понравился ваш\n комментарий: "Ты вернулась?""#
            ),
            textForTitleButton: nil,
            isHiddenButton: true,
            nameForPostImage: "museumImage",
            isHiddenPostImage: false
        ),
        .init(
            avatarNameImage: "avatarMark",
            notificationLabel: CommentShortInfo(
                userName: "markS",
                commentText: " появился(-ась) в\n RMLink. Вы можете быть\n знакомы "
            ),
            textForTitleButton: "Подписаться",
            isHiddenButton: false,
            nameForPostImage: nil,
            isHiddenPostImage: true
        ),
        .init(
            avatarNameImage: "avatarSvNeit",
            notificationLabel: CommentShortInfo(
                userName: "sv_neit",
                commentText: " появился(-ась)\n в RMLink. Вы можете\n быть знакомы "
            ),
            textForTitleButton: "Подписаться",
            isHiddenButton: false,
            nameForPostImage: nil,
            isHiddenPostImage: true
        ),
    ]
}

/// Данные для сегодняшних уведомлений
struct NotificationToday {
    let avatarNameImage: String
    let notificationLabel: CommentShortInfo?
    let nameForPostImage: String
}

/// Данные для уведомлений за неделю
struct NotificationThisWeek {
    let avatarNameImage: String
    let notificationLabel: CommentShortInfo?
    let textForTitleButton: String?
    let isHiddenButton: Bool
    let nameForPostImage: String?
    let isHiddenPostImage: Bool
}
