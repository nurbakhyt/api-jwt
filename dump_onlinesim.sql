-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 05 2017 г., 15:35
-- Версия сервера: 5.7.16
-- Версия PHP: 7.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `onlinesim`
--

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(47, '2014_10_12_000000_create_users_table', 1),
(48, '2014_10_12_100000_create_password_resets_table', 1),
(49, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(50, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(51, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(52, '2016_06_01_000004_create_oauth_clients_table', 1),
(53, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0289945f7f9da8da872f507afa3a4dc53ea5f648c20d6148f7e5a3b855aeccd42407eabc827099e7', 1, 2, NULL, '[]', 0, '2017-03-05 12:32:10', '2017-03-05 12:32:10', '2018-03-05 17:32:10'),
('0d30650604b9b84ff0c8cdea729fab643148e7f27906c49844084e4569951b772628971a01b62501', 6, 2, NULL, '[]', 0, '2017-03-05 12:33:54', '2017-03-05 12:33:54', '2018-03-05 17:33:54'),
('1f973393df4375b1fdde6abf1ec4effdc2825406090a60bf9203ea677d6ea4ae2525e532d895b3e9', 6, 2, NULL, '[]', 0, '2017-03-05 12:34:14', '2017-03-05 12:34:14', '2018-03-05 17:34:14'),
('4443796c222f1a0c38e5fb6d80731a911bbd874839b434623274a4ba09b2fea3ee502cc946775059', 1, 2, NULL, '[]', 0, '2017-03-05 12:31:42', '2017-03-05 12:31:42', '2018-03-05 17:31:42'),
('778eb07284fe4068621d6bb1a254ef77001a43882c304a732425d774cb25bb5568eb787fc35a4c1a', 5, 2, NULL, '[]', 0, '2017-03-05 12:35:16', '2017-03-05 12:35:16', '2018-03-05 17:35:16'),
('a348476db9743cc6c9eab5a30d5fd71cff1b3c691796526895cd0bb4ab102d50d72454cdcfd5fae8', 6, 2, NULL, '[]', 0, '2017-03-05 12:33:23', '2017-03-05 12:33:23', '2018-03-05 17:33:23'),
('af00dc219dbea383ea102160dc8c54e2c4a694f16520227a919626383def47ad57e1c1b0d83f81ef', 1, 2, NULL, '[]', 0, '2017-03-05 12:32:33', '2017-03-05 12:32:33', '2018-03-05 17:32:33'),
('fc16cb9bd84e871354d7b6fe7223fa1452030adaa59603f5b8c5ec462e10407f9d91922f91110ffc', 6, 2, NULL, '[]', 0, '2017-03-05 12:34:44', '2017-03-05 12:34:44', '2018-03-05 17:34:44');

-- --------------------------------------------------------

--
-- Структура таблицы `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'LCBe5Fe7ZFWNfVQQsmDtXai5QXMKgLi3mZLAnPW1', 'http://localhost', 1, 0, 0, '2017-03-05 12:31:14', '2017-03-05 12:31:14'),
(2, NULL, 'Laravel Password Grant Client', 'dNgTymMS46K2TFdQtxvfmzEWpQg1YDiLtz8Fs9Vo', 'http://localhost', 0, 1, 0, '2017-03-05 12:31:14', '2017-03-05 12:31:14');

-- --------------------------------------------------------

--
-- Структура таблицы `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2017-03-05 12:31:14', '2017-03-05 12:31:14');

-- --------------------------------------------------------

--
-- Структура таблицы `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('0aa87fa2d7d3bf48486eb03daae2031d5c802d2e1d625e7f391da783ba5d76bbfa1fb64f50741f7f', '4443796c222f1a0c38e5fb6d80731a911bbd874839b434623274a4ba09b2fea3ee502cc946775059', 0, '2018-03-05 17:31:42'),
('2606559a7dc851af0b68188e1bf470187dc41f4ec9e44be27e42c2d2ee142045a4ccdccbea6bd4d9', 'fc16cb9bd84e871354d7b6fe7223fa1452030adaa59603f5b8c5ec462e10407f9d91922f91110ffc', 0, '2018-03-05 17:34:44'),
('32dd3cf4f2e05d074c405d82551cd60dcbbb6aca22218c6b4b930a0f9639d13a2d4ac88dc8850c09', '0d30650604b9b84ff0c8cdea729fab643148e7f27906c49844084e4569951b772628971a01b62501', 0, '2018-03-05 17:33:54'),
('3dfa07e47a3b03680f237b04b6c596ceff86443d18816a8bb05fa0528b40c3b656ee3b1892bd8ce5', '0289945f7f9da8da872f507afa3a4dc53ea5f648c20d6148f7e5a3b855aeccd42407eabc827099e7', 0, '2018-03-05 17:32:10'),
('4fa827e7d29a6d0d3094fb6bc8ace9fe91c584e36116b039e98c8ea6d0750123c0e7b9b3c001142d', '778eb07284fe4068621d6bb1a254ef77001a43882c304a732425d774cb25bb5568eb787fc35a4c1a', 0, '2018-03-05 17:35:16'),
('76aa08092cd30209c58c9cbb8dc13dddf9ca3f0b0d25842f0ff5b9d268c0766f948102a94d3546a8', 'af00dc219dbea383ea102160dc8c54e2c4a694f16520227a919626383def47ad57e1c1b0d83f81ef', 0, '2018-03-05 17:32:33'),
('ad8f07185b6a94924de558b505bcf14240c956ea7b816387453f21b7bd4eed46443754c1c4ad050e', '1f973393df4375b1fdde6abf1ec4effdc2825406090a60bf9203ea677d6ea4ae2525e532d895b3e9', 0, '2018-03-05 17:34:14'),
('b84599e65e504dd056ff187cf3b612a466d616a1d71b07efeb8c1dbfda450c30f5eba59c0d1be400', 'a348476db9743cc6c9eab5a30d5fd71cff1b3c691796526895cd0bb4ab102d50d72454cdcfd5fae8', 0, '2018-03-05 17:33:23');

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Rose Bruen III', 'wreinger@example.net', '+2259204095999', '$2y$10$L/jFys6YLCcLgMTftLhW0eRqBnjoRJa2pAxNwB.DeYx2v/NcCCpKS', 'aQVJ7BfJDD', '2017-03-05 12:30:55', '2017-03-05 12:32:27'),
(2, 'Prof. Mae Hintz DVM', 'wkoepp@example.org', '+8179205266135', '$2y$10$JdE7JwR9sP6LGKM/xuUUheXFuXLRfbOm.mM5ZlZtBtggP8PJgn3cW', '1g2822kBAZ', '2017-03-05 12:30:55', '2017-03-05 12:30:55'),
(3, 'Lela Ritchie', 'stephon88@example.org', '+5017329822518', '$2y$10$JdE7JwR9sP6LGKM/xuUUheXFuXLRfbOm.mM5ZlZtBtggP8PJgn3cW', 'UqQkAkNZbS', '2017-03-05 12:30:55', '2017-03-05 12:30:55'),
(4, 'Prof. Raegan Ankunding III', 'brakus.ross@example.org', '+6742560065394', '$2y$10$JdE7JwR9sP6LGKM/xuUUheXFuXLRfbOm.mM5ZlZtBtggP8PJgn3cW', 'TGUn1TOD4U', '2017-03-05 12:30:55', '2017-03-05 12:30:55'),
(5, 'Daniella Beier', 'jolie.farrell@example.com', '+9973854996535', '$2y$10$JdE7JwR9sP6LGKM/xuUUheXFuXLRfbOm.mM5ZlZtBtggP8PJgn3cW', 'gY79YB6gJ5', '2017-03-05 12:30:55', '2017-03-05 12:30:55'),
(6, 'User Username', 'wreingeer@example.net', '+77', '$2y$10$lK8oPoIyrfm7JxJ2XpRh.u.jyYPO2C2r/atgvPlCCdaPrMsZ62SCS', NULL, '2017-03-05 12:33:11', '2017-03-05 12:34:28');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Индексы таблицы `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Индексы таблицы `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Индексы таблицы `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT для таблицы `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
