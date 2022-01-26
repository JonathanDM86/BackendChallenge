/*
 Navicat Premium Data Transfer

 Source Server         : LocalHost
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : db_challenge

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 26/01/2022 13:25:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for c_badges
-- ----------------------------
DROP TABLE IF EXISTS `c_badges`;
CREATE TABLE `c_badges`  (
  `id_badge` int NOT NULL AUTO_INCREMENT,
  `badge` varchar(15) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `min` int NOT NULL,
  `max` int NOT NULL,
  `status` char(1) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT 'A' COMMENT 'A=Active D=delete',
  PRIMARY KEY (`id_badge`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_badges
-- ----------------------------
INSERT INTO `c_badges` VALUES (1, 'Nothing', 0, 10, 'A');
INSERT INTO `c_badges` VALUES (2, 'Bronce', 11, 44, 'A');
INSERT INTO `c_badges` VALUES (3, 'Silver', 45, 99, 'A');
INSERT INTO `c_badges` VALUES (4, 'Gold', 100, 144, 'A');
INSERT INTO `c_badges` VALUES (5, 'Platinum', 145, 0, 'A');

-- ----------------------------
-- Table structure for c_countrys
-- ----------------------------
DROP TABLE IF EXISTS `c_countrys`;
CREATE TABLE `c_countrys`  (
  `id_country` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `code` char(2) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `phone_code` varchar(7) CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT 'A' COMMENT 'A=active, D=Delete',
  PRIMARY KEY (`id_country`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 250 CHARACTER SET = latin1 COLLATE = latin1_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_countrys
-- ----------------------------
INSERT INTO `c_countrys` VALUES (1, 'Afghanistan', 'AF', '93', 'A');
INSERT INTO `c_countrys` VALUES (2, 'Albania', 'AL', '355', 'A');
INSERT INTO `c_countrys` VALUES (3, 'Germany', 'DE', '49', 'A');
INSERT INTO `c_countrys` VALUES (4, 'Andorra', 'AD', '376', 'A');
INSERT INTO `c_countrys` VALUES (5, 'Angola', 'AO', '244', 'A');
INSERT INTO `c_countrys` VALUES (6, 'Anguilla', 'AI', '1 264', 'A');
INSERT INTO `c_countrys` VALUES (7, 'Antarctica', 'AQ', '672', 'A');
INSERT INTO `c_countrys` VALUES (8, 'Antigua and Barbuda', 'AG', '1 268', 'A');
INSERT INTO `c_countrys` VALUES (9, 'Saudi Arabia', 'SA', '966', 'A');
INSERT INTO `c_countrys` VALUES (10, 'Algeria', 'DZ', '213', 'A');
INSERT INTO `c_countrys` VALUES (11, 'Argentina', 'AR', '54', 'A');
INSERT INTO `c_countrys` VALUES (12, 'Armenia', 'AM', '374', 'A');
INSERT INTO `c_countrys` VALUES (13, 'Aruba', 'AW', '297', 'A');
INSERT INTO `c_countrys` VALUES (14, 'Australia', 'AU', '61', 'A');
INSERT INTO `c_countrys` VALUES (15, 'Austria', 'AT', '43', 'A');
INSERT INTO `c_countrys` VALUES (16, 'Azerbaijan', 'AZ', '994', 'A');
INSERT INTO `c_countrys` VALUES (17, 'Belgium', 'BE', '32', 'A');
INSERT INTO `c_countrys` VALUES (18, 'Bahamas', 'BS', '1 242', 'A');
INSERT INTO `c_countrys` VALUES (19, 'Bahrain', 'BH', '973', 'A');
INSERT INTO `c_countrys` VALUES (20, 'Bangladesh', 'BD', '880', 'A');
INSERT INTO `c_countrys` VALUES (21, 'Barbados', 'BB', '1 246', 'A');
INSERT INTO `c_countrys` VALUES (22, 'Belize', 'BZ', '501', 'A');
INSERT INTO `c_countrys` VALUES (23, 'Benin', 'BJ', '229', 'A');
INSERT INTO `c_countrys` VALUES (24, 'Bhutan', 'BT', '975', 'A');
INSERT INTO `c_countrys` VALUES (25, 'Belarus', 'BY', '375', 'A');
INSERT INTO `c_countrys` VALUES (26, 'Myanmar', 'MM', '95', 'A');
INSERT INTO `c_countrys` VALUES (27, 'Bolivia', 'BO', '591', 'A');
INSERT INTO `c_countrys` VALUES (28, 'Bonaire', 'BQ', '535', 'A');
INSERT INTO `c_countrys` VALUES (29, 'Bosnia and Herzegovina', 'BA', '387', 'A');
INSERT INTO `c_countrys` VALUES (30, 'Botswana', 'BW', '267', 'A');
INSERT INTO `c_countrys` VALUES (31, 'Brazil', 'BR', '55', 'A');
INSERT INTO `c_countrys` VALUES (32, 'Brunei', 'BN', '673', 'A');
INSERT INTO `c_countrys` VALUES (33, 'Bulgaria', 'BG', '359', 'A');
INSERT INTO `c_countrys` VALUES (34, 'Burkina Faso', 'BF', '226', 'A');
INSERT INTO `c_countrys` VALUES (35, 'Burundi', 'BI', '257', 'A');
INSERT INTO `c_countrys` VALUES (36, 'Cape Verde', 'CV', '238', 'A');
INSERT INTO `c_countrys` VALUES (37, 'Cambodia', 'KH', '855', 'A');
INSERT INTO `c_countrys` VALUES (38, 'Cameroon', 'CM', '237', 'A');
INSERT INTO `c_countrys` VALUES (39, 'Canada', 'CA', '1', 'A');
INSERT INTO `c_countrys` VALUES (40, 'Chad', 'TD', '235', 'A');
INSERT INTO `c_countrys` VALUES (41, 'Chile', 'CL', '56', 'A');
INSERT INTO `c_countrys` VALUES (42, 'China', 'CN', '86', 'A');
INSERT INTO `c_countrys` VALUES (43, 'Cyprus', 'CY', '357', 'A');
INSERT INTO `c_countrys` VALUES (44, 'Vatican City State', 'VA', '39', 'A');
INSERT INTO `c_countrys` VALUES (45, 'Colombia', 'CO', '57', 'A');
INSERT INTO `c_countrys` VALUES (46, 'Comoros', 'KM', '269', 'A');
INSERT INTO `c_countrys` VALUES (47, 'Republic of the Congo', 'CG', '242', 'A');
INSERT INTO `c_countrys` VALUES (48, 'Democratic Republic of the Congo', 'CD', '243', 'A');
INSERT INTO `c_countrys` VALUES (49, 'North Korea', 'KP', '850', 'A');
INSERT INTO `c_countrys` VALUES (50, 'South Korea', 'KR', '82', 'A');
INSERT INTO `c_countrys` VALUES (51, 'Ivory Coast', 'CI', '225', 'A');
INSERT INTO `c_countrys` VALUES (52, 'Costa Rica', 'CR', '506', 'A');
INSERT INTO `c_countrys` VALUES (53, 'Croatia', 'HR', '385', 'A');
INSERT INTO `c_countrys` VALUES (54, 'Cuba', 'CU', '53', 'A');
INSERT INTO `c_countrys` VALUES (55, 'Curaçao', 'CW', '5999', 'A');
INSERT INTO `c_countrys` VALUES (56, 'Denmark', 'DK', '45', 'A');
INSERT INTO `c_countrys` VALUES (57, 'Dominica', 'DM', '1 767', 'A');
INSERT INTO `c_countrys` VALUES (58, 'Ecuador', 'EC', '593', 'A');
INSERT INTO `c_countrys` VALUES (59, 'Egypt', 'EG', '20', 'A');
INSERT INTO `c_countrys` VALUES (60, 'El Salvador', 'SV', '503', 'A');
INSERT INTO `c_countrys` VALUES (61, 'United Arab Emirates', 'AE', '971', 'A');
INSERT INTO `c_countrys` VALUES (62, 'Eritrea', 'ER', '291', 'A');
INSERT INTO `c_countrys` VALUES (63, 'Slovakia', 'SK', '421', 'A');
INSERT INTO `c_countrys` VALUES (64, 'Slovenia', 'SI', '386', 'A');
INSERT INTO `c_countrys` VALUES (65, 'Spain', 'ES', '34', 'A');
INSERT INTO `c_countrys` VALUES (66, 'United States of America', 'US', '1', 'A');
INSERT INTO `c_countrys` VALUES (67, 'Estonia', 'EE', '372', 'A');
INSERT INTO `c_countrys` VALUES (68, 'Ethiopia', 'ET', '251', 'A');
INSERT INTO `c_countrys` VALUES (69, 'Philippines', 'PH', '63', 'A');
INSERT INTO `c_countrys` VALUES (70, 'Finland', 'FI', '358', 'A');
INSERT INTO `c_countrys` VALUES (71, 'Fiji', 'FJ', '679', 'A');
INSERT INTO `c_countrys` VALUES (72, 'France', 'FR', '33', 'A');
INSERT INTO `c_countrys` VALUES (73, 'Gabon', 'GA', '241', 'A');
INSERT INTO `c_countrys` VALUES (74, 'Gambia', 'GM', '220', 'A');
INSERT INTO `c_countrys` VALUES (75, 'Georgia', 'GE', '995', 'A');
INSERT INTO `c_countrys` VALUES (76, 'Ghana', 'GH', '233', 'A');
INSERT INTO `c_countrys` VALUES (77, 'Gibraltar', 'GI', '350', 'A');
INSERT INTO `c_countrys` VALUES (78, 'Grenada', 'GD', '1 473', 'A');
INSERT INTO `c_countrys` VALUES (79, 'Greece', 'GR', '30', 'A');
INSERT INTO `c_countrys` VALUES (80, 'Greenland', 'GL', '299', 'A');
INSERT INTO `c_countrys` VALUES (81, 'Guadeloupe', 'GP', '590', 'A');
INSERT INTO `c_countrys` VALUES (82, 'Guam', 'GU', '1 671', 'A');
INSERT INTO `c_countrys` VALUES (83, 'Guatemala', 'GT', '502', 'A');
INSERT INTO `c_countrys` VALUES (84, 'French Guiana', 'GF', '594', 'A');
INSERT INTO `c_countrys` VALUES (85, 'Guernsey', 'GG', '44', 'A');
INSERT INTO `c_countrys` VALUES (86, 'Guinea', 'GN', '224', 'A');
INSERT INTO `c_countrys` VALUES (87, 'Equatorial Guinea', 'GQ', '240', 'A');
INSERT INTO `c_countrys` VALUES (88, 'Guinea-Bissau', 'GW', '245', 'A');
INSERT INTO `c_countrys` VALUES (89, 'Guyana', 'GY', '592', 'A');
INSERT INTO `c_countrys` VALUES (90, 'Haiti', 'HT', '509', 'A');
INSERT INTO `c_countrys` VALUES (91, 'Honduras', 'HN', '504', 'A');
INSERT INTO `c_countrys` VALUES (92, 'Hong Kong', 'HK', '852', 'A');
INSERT INTO `c_countrys` VALUES (93, 'Hungary', 'HU', '36', 'A');
INSERT INTO `c_countrys` VALUES (94, 'India', 'IN', '91', 'A');
INSERT INTO `c_countrys` VALUES (95, 'Indonesia', 'ID', '62', 'A');
INSERT INTO `c_countrys` VALUES (96, 'Iran', 'IR', '98', 'A');
INSERT INTO `c_countrys` VALUES (97, 'Iraq', 'IQ', '964', 'A');
INSERT INTO `c_countrys` VALUES (98, 'Ireland', 'IE', '353', 'A');
INSERT INTO `c_countrys` VALUES (99, 'Bouvet Island', 'BV', NULL, 'A');
INSERT INTO `c_countrys` VALUES (100, 'Isle of Man', 'IM', '44', 'A');
INSERT INTO `c_countrys` VALUES (101, 'Christmas Island', 'CX', '61', 'A');
INSERT INTO `c_countrys` VALUES (102, 'Norfolk Island', 'NF', '672', 'A');
INSERT INTO `c_countrys` VALUES (103, 'Iceland', 'IS', '354', 'A');
INSERT INTO `c_countrys` VALUES (104, 'Bermuda Islands', 'BM', '1 441', 'A');
INSERT INTO `c_countrys` VALUES (105, 'Cayman Islands', 'KY', '1 345', 'A');
INSERT INTO `c_countrys` VALUES (106, 'Cocos (Keeling) Islands', 'CC', '61', 'A');
INSERT INTO `c_countrys` VALUES (107, 'Cook Islands', 'CK', '682', 'A');
INSERT INTO `c_countrys` VALUES (108, 'Åland Islands', 'AX', '358', 'A');
INSERT INTO `c_countrys` VALUES (109, 'Faroe Islands', 'FO', '298', 'A');
INSERT INTO `c_countrys` VALUES (110, 'South Georgia and the South Sandwich Islands', 'GS', '500', 'A');
INSERT INTO `c_countrys` VALUES (111, 'Heard Island and McDonald Islands', 'HM', NULL, 'A');
INSERT INTO `c_countrys` VALUES (112, 'Maldives', 'MV', '960', 'A');
INSERT INTO `c_countrys` VALUES (113, 'Falkland Islands (Malvinas)', 'FK', '500', 'A');
INSERT INTO `c_countrys` VALUES (114, 'Northern Mariana Islands', 'MP', '1 670', 'A');
INSERT INTO `c_countrys` VALUES (115, 'Marshall Islands', 'MH', '692', 'A');
INSERT INTO `c_countrys` VALUES (116, 'Pitcairn Islands', 'PN', '870', 'A');
INSERT INTO `c_countrys` VALUES (117, 'Solomon Islands', 'SB', '677', 'A');
INSERT INTO `c_countrys` VALUES (118, 'Turks and Caicos Islands', 'TC', '1 649', 'A');
INSERT INTO `c_countrys` VALUES (119, 'United States Minor Outlying Islands', 'UM', '246', 'A');
INSERT INTO `c_countrys` VALUES (120, 'Virgin Islands', 'VG', '1 284', 'A');
INSERT INTO `c_countrys` VALUES (121, 'United States Virgin Islands', 'VI', '1 340', 'A');
INSERT INTO `c_countrys` VALUES (122, 'Israel', 'IL', '972', 'A');
INSERT INTO `c_countrys` VALUES (123, 'Italy', 'IT', '39', 'A');
INSERT INTO `c_countrys` VALUES (124, 'Jamaica', 'JM', '1 876', 'A');
INSERT INTO `c_countrys` VALUES (125, 'Japan', 'JP', '81', 'A');
INSERT INTO `c_countrys` VALUES (126, 'Jersey', 'JE', '44', 'A');
INSERT INTO `c_countrys` VALUES (127, 'Jordan', 'JO', '962', 'A');
INSERT INTO `c_countrys` VALUES (128, 'Kazakhstan', 'KZ', '7', 'A');
INSERT INTO `c_countrys` VALUES (129, 'Kenya', 'KE', '254', 'A');
INSERT INTO `c_countrys` VALUES (130, 'Kyrgyzstan', 'KG', '996', 'A');
INSERT INTO `c_countrys` VALUES (131, 'Kiribati', 'KI', '686', 'A');
INSERT INTO `c_countrys` VALUES (132, 'Kuwait', 'KW', '965', 'A');
INSERT INTO `c_countrys` VALUES (133, 'Lebanon', 'LB', '961', 'A');
INSERT INTO `c_countrys` VALUES (134, 'Laos', 'LA', '856', 'A');
INSERT INTO `c_countrys` VALUES (135, 'Lesotho', 'LS', '266', 'A');
INSERT INTO `c_countrys` VALUES (136, 'Latvia', 'LV', '371', 'A');
INSERT INTO `c_countrys` VALUES (137, 'Liberia', 'LR', '231', 'A');
INSERT INTO `c_countrys` VALUES (138, 'Libya', 'LY', '218', 'A');
INSERT INTO `c_countrys` VALUES (139, 'Liechtenstein', 'LI', '423', 'A');
INSERT INTO `c_countrys` VALUES (140, 'Lithuania', 'LT', '370', 'A');
INSERT INTO `c_countrys` VALUES (141, 'Luxembourg', 'LU', '352', 'A');
INSERT INTO `c_countrys` VALUES (142, 'Mexico', 'MX', '52', 'A');
INSERT INTO `c_countrys` VALUES (143, 'Monaco', 'MC', '377', 'A');
INSERT INTO `c_countrys` VALUES (144, 'Macao', 'MO', '853', 'A');
INSERT INTO `c_countrys` VALUES (145, 'Macedonia', 'MK', '389', 'A');
INSERT INTO `c_countrys` VALUES (146, 'Madagascar', 'MG', '261', 'A');
INSERT INTO `c_countrys` VALUES (147, 'Malaysia', 'MY', '60', 'A');
INSERT INTO `c_countrys` VALUES (148, 'Malawi', 'MW', '265', 'A');
INSERT INTO `c_countrys` VALUES (149, 'Mali', 'ML', '223', 'A');
INSERT INTO `c_countrys` VALUES (150, 'Malta', 'MT', '356', 'A');
INSERT INTO `c_countrys` VALUES (151, 'Morocco', 'MA', '212', 'A');
INSERT INTO `c_countrys` VALUES (152, 'Martinique', 'MQ', '596', 'A');
INSERT INTO `c_countrys` VALUES (153, 'Mauritius', 'MU', '230', 'A');
INSERT INTO `c_countrys` VALUES (154, 'Mauritania', 'MR', '222', 'A');
INSERT INTO `c_countrys` VALUES (155, 'Mayotte', 'YT', '262', 'A');
INSERT INTO `c_countrys` VALUES (156, 'Estados Federados de', 'FM', '691', 'A');
INSERT INTO `c_countrys` VALUES (157, 'Moldova', 'MD', '373', 'A');
INSERT INTO `c_countrys` VALUES (158, 'Mongolia', 'MN', '976', 'A');
INSERT INTO `c_countrys` VALUES (159, 'Montenegro', 'ME', '382', 'A');
INSERT INTO `c_countrys` VALUES (160, 'Montserrat', 'MS', '1 664', 'A');
INSERT INTO `c_countrys` VALUES (161, 'Mozambique', 'MZ', '258', 'A');
INSERT INTO `c_countrys` VALUES (162, 'Namibia', 'NA', '264', 'A');
INSERT INTO `c_countrys` VALUES (163, 'Nauru', 'NR', '674', 'A');
INSERT INTO `c_countrys` VALUES (164, 'Nepal', 'NP', '977', 'A');
INSERT INTO `c_countrys` VALUES (165, 'Nicaragua', 'NI', '505', 'A');
INSERT INTO `c_countrys` VALUES (166, 'Niger', 'NE', '227', 'A');
INSERT INTO `c_countrys` VALUES (167, 'Nigeria', 'NG', '234', 'A');
INSERT INTO `c_countrys` VALUES (168, 'Niue', 'NU', '683', 'A');
INSERT INTO `c_countrys` VALUES (169, 'Norway', 'NO', '47', 'A');
INSERT INTO `c_countrys` VALUES (170, 'New Caledonia', 'NC', '687', 'A');
INSERT INTO `c_countrys` VALUES (171, 'New Zealand', 'NZ', '64', 'A');
INSERT INTO `c_countrys` VALUES (172, 'Oman', 'OM', '968', 'A');
INSERT INTO `c_countrys` VALUES (173, 'Netherlands', 'NL', '31', 'A');
INSERT INTO `c_countrys` VALUES (174, 'Pakistan', 'PK', '92', 'A');
INSERT INTO `c_countrys` VALUES (175, 'Palau', 'PW', '680', 'A');
INSERT INTO `c_countrys` VALUES (176, 'Palestine', 'PS', '970', 'A');
INSERT INTO `c_countrys` VALUES (177, 'Panama', 'PA', '507', 'A');
INSERT INTO `c_countrys` VALUES (178, 'Papua New Guinea', 'PG', '675', 'A');
INSERT INTO `c_countrys` VALUES (179, 'Paraguay', 'PY', '595', 'A');
INSERT INTO `c_countrys` VALUES (180, 'Peru', 'PE', '51', 'A');
INSERT INTO `c_countrys` VALUES (181, 'French Polynesia', 'PF', '689', 'A');
INSERT INTO `c_countrys` VALUES (182, 'Poland', 'PL', '48', 'A');
INSERT INTO `c_countrys` VALUES (183, 'Portugal', 'PT', '351', 'A');
INSERT INTO `c_countrys` VALUES (184, 'Puerto Rico', 'PR', '1', 'A');
INSERT INTO `c_countrys` VALUES (185, 'Qatar', 'QA', '974', 'A');
INSERT INTO `c_countrys` VALUES (186, 'United Kingdom', 'GB', '44', 'A');
INSERT INTO `c_countrys` VALUES (187, 'Central African Republic', 'CF', '236', 'A');
INSERT INTO `c_countrys` VALUES (188, 'Czech Republic', 'CZ', '420', 'A');
INSERT INTO `c_countrys` VALUES (189, 'Dominican Republic', 'DO', '1 809', 'A');
INSERT INTO `c_countrys` VALUES (190, 'South Sudan', 'SS', '211', 'A');
INSERT INTO `c_countrys` VALUES (191, 'Réunion', 'RE', '262', 'A');
INSERT INTO `c_countrys` VALUES (192, 'Rwanda', 'RW', '250', 'A');
INSERT INTO `c_countrys` VALUES (193, 'Romania', 'RO', '40', 'A');
INSERT INTO `c_countrys` VALUES (194, 'Russia', 'RU', '7', 'A');
INSERT INTO `c_countrys` VALUES (195, 'Western Sahara', 'EH', '212', 'A');
INSERT INTO `c_countrys` VALUES (196, 'Samoa', 'WS', '685', 'A');
INSERT INTO `c_countrys` VALUES (197, 'American Samoa', 'AS', '1 684', 'A');
INSERT INTO `c_countrys` VALUES (198, 'Saint Barthélemy', 'BL', '590', 'A');
INSERT INTO `c_countrys` VALUES (199, 'Saint Kitts and Nevis', 'KN', '1 869', 'A');
INSERT INTO `c_countrys` VALUES (200, 'San Marino', 'SM', '378', 'A');
INSERT INTO `c_countrys` VALUES (201, 'Saint Martin (French part)', 'MF', '1 599', 'A');
INSERT INTO `c_countrys` VALUES (202, 'Saint Pierre and Miquelon', 'PM', '508', 'A');
INSERT INTO `c_countrys` VALUES (203, 'Saint Vincent and the Grenadines', 'VC', '1 784', 'A');
INSERT INTO `c_countrys` VALUES (204, 'Ascensión y Tristán de Acuña', 'SH', '290', 'A');
INSERT INTO `c_countrys` VALUES (205, 'Saint Lucia', 'LC', '1 758', 'A');
INSERT INTO `c_countrys` VALUES (206, 'Sao Tome and Principe', 'ST', '239', 'A');
INSERT INTO `c_countrys` VALUES (207, 'Senegal', 'SN', '221', 'A');
INSERT INTO `c_countrys` VALUES (208, 'Serbia', 'RS', '381', 'A');
INSERT INTO `c_countrys` VALUES (209, 'Seychelles', 'SC', '248', 'A');
INSERT INTO `c_countrys` VALUES (210, 'Sierra Leone', 'SL', '232', 'A');
INSERT INTO `c_countrys` VALUES (211, 'Singapore', 'SG', '65', 'A');
INSERT INTO `c_countrys` VALUES (212, 'Sint Maarten', 'SX', '1 721', 'A');
INSERT INTO `c_countrys` VALUES (213, 'Syria', 'SY', '963', 'A');
INSERT INTO `c_countrys` VALUES (214, 'Somalia', 'SO', '252', 'A');
INSERT INTO `c_countrys` VALUES (215, 'Sri Lanka', 'LK', '94', 'A');
INSERT INTO `c_countrys` VALUES (216, 'South Africa', 'ZA', '27', 'A');
INSERT INTO `c_countrys` VALUES (217, 'Sudan', 'SD', '249', 'A');
INSERT INTO `c_countrys` VALUES (218, 'Sweden', 'SE', '46', 'A');
INSERT INTO `c_countrys` VALUES (219, 'Switzerland', 'CH', '41', 'A');
INSERT INTO `c_countrys` VALUES (220, 'Suriname', 'SR', '597', 'A');
INSERT INTO `c_countrys` VALUES (221, 'Svalbard and Jan Mayen', 'SJ', '47', 'A');
INSERT INTO `c_countrys` VALUES (222, 'Swaziland', 'SZ', '268', 'A');
INSERT INTO `c_countrys` VALUES (223, 'Tajikistan', 'TJ', '992', 'A');
INSERT INTO `c_countrys` VALUES (224, 'Thailand', 'TH', '66', 'A');
INSERT INTO `c_countrys` VALUES (225, 'Taiwan', 'TW', '886', 'A');
INSERT INTO `c_countrys` VALUES (226, 'Tanzania', 'TZ', '255', 'A');
INSERT INTO `c_countrys` VALUES (227, 'British Indian Ocean Territory', 'IO', '246', 'A');
INSERT INTO `c_countrys` VALUES (228, 'French Southern Territories', 'TF', NULL, 'A');
INSERT INTO `c_countrys` VALUES (229, 'East Timor', 'TL', '670', 'A');
INSERT INTO `c_countrys` VALUES (230, 'Togo', 'TG', '228', 'A');
INSERT INTO `c_countrys` VALUES (231, 'Tokelau', 'TK', '690', 'A');
INSERT INTO `c_countrys` VALUES (232, 'Tonga', 'TO', '676', 'A');
INSERT INTO `c_countrys` VALUES (233, 'Trinidad and Tobago', 'TT', '1 868', 'A');
INSERT INTO `c_countrys` VALUES (234, 'Tunisia', 'TN', '216', 'A');
INSERT INTO `c_countrys` VALUES (235, 'Turkmenistan', 'TM', '993', 'A');
INSERT INTO `c_countrys` VALUES (236, 'Turkey', 'TR', '90', 'A');
INSERT INTO `c_countrys` VALUES (237, 'Tuvalu', 'TV', '688', 'A');
INSERT INTO `c_countrys` VALUES (238, 'Ukraine', 'UA', '380', 'A');
INSERT INTO `c_countrys` VALUES (239, 'Uganda', 'UG', '256', 'A');
INSERT INTO `c_countrys` VALUES (240, 'Uruguay', 'UY', '598', 'A');
INSERT INTO `c_countrys` VALUES (241, 'Uzbekistan', 'UZ', '998', 'A');
INSERT INTO `c_countrys` VALUES (242, 'Vanuatu', 'VU', '678', 'A');
INSERT INTO `c_countrys` VALUES (243, 'Venezuela', 'VE', '58', 'A');
INSERT INTO `c_countrys` VALUES (244, 'Vietnam', 'VN', '84', 'A');
INSERT INTO `c_countrys` VALUES (245, 'Wallis and Futuna', 'WF', '681', 'A');
INSERT INTO `c_countrys` VALUES (246, 'Yemen', 'YE', '967', 'A');
INSERT INTO `c_countrys` VALUES (247, 'Djibouti', 'DJ', '253', 'A');
INSERT INTO `c_countrys` VALUES (248, 'Zambia', 'ZM', '260', 'A');
INSERT INTO `c_countrys` VALUES (249, 'Zimbabwe', 'ZW', '263', 'A');

-- ----------------------------
-- Table structure for t_relations
-- ----------------------------
DROP TABLE IF EXISTS `t_relations`;
CREATE TABLE `t_relations`  (
  `id_relation` int NOT NULL AUTO_INCREMENT,
  `id_userA` int NOT NULL COMMENT 'user adding relationship',
  `id_userR` int NOT NULL COMMENT 'user receiving relationship',
  `date_add` date NOT NULL,
  `time_add` time(0) NOT NULL,
  `status` char(1) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT 'A' COMMENT 'A=Active, D=Delete',
  PRIMARY KEY (`id_relation`) USING BTREE,
  INDEX `FK_idUserA`(`id_userA`) USING BTREE,
  INDEX `FK_idUserR`(`id_userR`) USING BTREE,
  CONSTRAINT `FK_idUserA` FOREIGN KEY (`id_userA`) REFERENCES `t_users` (`id_user`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_idUserR` FOREIGN KEY (`id_userR`) REFERENCES `t_users` (`id_user`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_relations
-- ----------------------------
INSERT INTO `t_relations` VALUES (1, 1, 2, '2022-01-25', '16:54:05', 'A');
INSERT INTO `t_relations` VALUES (2, 1, 3, '2022-01-25', '16:56:04', 'A');
INSERT INTO `t_relations` VALUES (3, 5, 3, '2022-01-25', '17:39:15', 'A');
INSERT INTO `t_relations` VALUES (4, 5, 8, '2022-01-25', '17:39:31', 'A');
INSERT INTO `t_relations` VALUES (5, 5, 9, '2022-01-25', '17:39:42', 'A');
INSERT INTO `t_relations` VALUES (6, 5, 10, '2022-01-25', '17:39:52', 'A');
INSERT INTO `t_relations` VALUES (7, 1, 5, '2022-01-25', '17:42:04', 'A');
INSERT INTO `t_relations` VALUES (8, 5, 1, '2022-01-25', '17:45:04', 'A');
INSERT INTO `t_relations` VALUES (9, 1, 21, '2022-01-26', '10:36:47', 'A');
INSERT INTO `t_relations` VALUES (10, 1, 11, '2022-01-26', '10:36:47', 'A');
INSERT INTO `t_relations` VALUES (11, 1, 29, '2022-01-26', '10:36:47', 'A');
INSERT INTO `t_relations` VALUES (12, 1, 27, '2022-01-26', '10:36:47', 'A');
INSERT INTO `t_relations` VALUES (13, 1, 20, '2022-01-26', '10:36:47', 'A');
INSERT INTO `t_relations` VALUES (14, 1, 28, '2022-01-26', '10:36:47', 'A');
INSERT INTO `t_relations` VALUES (15, 1, 25, '2022-01-26', '10:36:47', 'A');
INSERT INTO `t_relations` VALUES (16, 1, 19, '2022-01-26', '10:36:48', 'A');
INSERT INTO `t_relations` VALUES (17, 1, 16, '2022-01-26', '10:36:48', 'A');
INSERT INTO `t_relations` VALUES (18, 1, 12, '2022-01-26', '10:36:48', 'A');
INSERT INTO `t_relations` VALUES (19, 1, 18, '2022-01-26', '10:36:48', 'A');
INSERT INTO `t_relations` VALUES (20, 1, 7, '2022-01-26', '10:36:48', 'A');
INSERT INTO `t_relations` VALUES (21, 1, 24, '2022-01-26', '10:36:48', 'A');
INSERT INTO `t_relations` VALUES (22, 1, 26, '2022-01-26', '10:36:48', 'A');
INSERT INTO `t_relations` VALUES (23, 1, 23, '2022-01-26', '10:36:48', 'A');

-- ----------------------------
-- Table structure for t_users
-- ----------------------------
DROP TABLE IF EXISTS `t_users`;
CREATE TABLE `t_users`  (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(150) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `LastName` varchar(150) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `Email` varchar(200) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `Password` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `id_country` int NOT NULL,
  `id_badge` int NOT NULL DEFAULT 1,
  `status` char(1) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT 'A' COMMENT 'A=active, D=delete',
  PRIMARY KEY (`id_user`) USING BTREE,
  UNIQUE INDEX `EmailKey`(`Email`) USING BTREE,
  INDEX `FK_country`(`id_country`) USING BTREE,
  INDEX `FK_badge`(`id_badge`) USING BTREE,
  CONSTRAINT `FK_badge` FOREIGN KEY (`id_badge`) REFERENCES `c_badges` (`id_badge`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_country` FOREIGN KEY (`id_country`) REFERENCES `c_countrys` (`id_country`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = latin1 COLLATE = latin1_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_users
-- ----------------------------
INSERT INTO `t_users` VALUES (1, 'Jonathan G', 'Diaz M', 'jonathan.dimor@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 142, 2, 'A');
INSERT INTO `t_users` VALUES (2, 'Clay', 'Keebler', 'rossie91@oconner.com', '21103cc785ab42afd24305fe116d35a0', 142, 1, 'A');
INSERT INTO `t_users` VALUES (3, 'Cleta', 'Schimmel', 'ledner.matt@hotmail.com', '94503e6555cb7bd13a62276bfb1b4b81', 142, 1, 'A');
INSERT INTO `t_users` VALUES (4, 'Oda', 'Hayes', 'heaven63@cronin.info', '95bcef38f7850e13b4f698a9258d09bb', 142, 1, 'A');
INSERT INTO `t_users` VALUES (5, 'Eric', 'Howell', 'larson.christop@kirlin.biz', '827ccb0eea8a706c4c34a16891f84e7b', 142, 1, 'A');
INSERT INTO `t_users` VALUES (6, 'Daphnee', 'Kuvalis', 'bbarrows@hotmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 142, 1, 'A');
INSERT INTO `t_users` VALUES (7, 'Mary', 'Conn', 'nelson.mohr@weimann.com', '827ccb0eea8a706c4c34a16891f84e7b', 66, 1, 'A');
INSERT INTO `t_users` VALUES (8, 'Berenice', 'Bartell', 'corrine77@pacocha.com', 'e9c67f0d7665e1eb5faf56065f235757', 66, 1, 'A');
INSERT INTO `t_users` VALUES (9, 'Caroline', 'Heidenreich', 'bobbie.quitzon@yahoo.com', '830c10b8f2fdc46ae7f9b6ccf3f2df75', 66, 1, 'A');
INSERT INTO `t_users` VALUES (10, 'Gregorio', 'Morales', 'jonathan.dimor86@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 142, 1, 'A');
INSERT INTO `t_users` VALUES (11, 'Jensen', 'Collins', 'cassin.joesph@swaniawski.com', '610ad80e22ed6d934b1b02b74bd5f01a', 66, 1, 'A');
INSERT INTO `t_users` VALUES (12, 'Saul', 'Terry', 'xstehr@hotmail.com', '1b5701dc8edd8ad688b069d4fb1874a3', 66, 1, 'A');
INSERT INTO `t_users` VALUES (13, 'Gunner', 'Reynolds', 'moriah.orn@gmail.com', '12142d3a83b1fe83854341d1b06478cf', 66, 1, 'A');
INSERT INTO `t_users` VALUES (14, 'Devin', 'Bruen', 'nhodkiewicz@yahoo.com', 'cbe58fc196c6efbb18d1781013bc435a', 66, 1, 'A');
INSERT INTO `t_users` VALUES (15, 'Mittie', 'Emard', 'bwilliamson@gmail.com', 'c8eaadc76e334c33bc6406b72a2403d6', 66, 1, 'A');
INSERT INTO `t_users` VALUES (16, 'Henry', 'Zieme', 'azemlak@gmail.com', '135b6a710c9cb9cf76ce96993387b910', 142, 1, 'A');
INSERT INTO `t_users` VALUES (17, 'Addison', 'Breitenberg', 'reinhold.halvorson@gmail.com', 'bd1a82f5fca3fd7ba55c38be24218b2c', 142, 1, 'A');
INSERT INTO `t_users` VALUES (18, 'Amiya', 'Frami', 'camylle.reichert@rath.com', '4f0f926c97a6bc7fd7f07f0add96067c', 142, 1, 'A');
INSERT INTO `t_users` VALUES (19, 'Jaylen', 'Kovacek', 'meda12@aufderhar.org', '8800a018aa6dfb7ff1d5fe4028b31aee', 142, 1, 'A');
INSERT INTO `t_users` VALUES (20, 'Earlene', 'Johns', 'deion.tromp@bechtelar.com', '5dd79ee168c5309208e9585cf7274bed', 142, 1, 'A');
INSERT INTO `t_users` VALUES (21, 'Pattie', 'Wisoky', 'vhoppe@homenick.com', '28d774379b9e3cbda668055e1bb7a61b', 142, 1, 'A');
INSERT INTO `t_users` VALUES (22, 'Alexa', 'Schamberger', 'braun.vern@johnston.org', '675b0c2cab1df6e50a640e0c092e37c8', 142, 1, 'A');
INSERT INTO `t_users` VALUES (23, 'Hosea', 'McClure', 'zwillms@gleason.com', '86a5b4e031d547940bc9f3a59b219f73', 142, 1, 'A');
INSERT INTO `t_users` VALUES (24, 'Jevon', 'Metz', 'garrick29@hotmail.com', 'cd28bb02181820ae07d80dd5b1e6f1cb', 142, 1, 'A');
INSERT INTO `t_users` VALUES (25, 'Lillie', 'Kihn', 'jbeer@nikolaus.net', '46fbe35eb4636c71cc5c67b64dfe5d52', 142, 1, 'A');
INSERT INTO `t_users` VALUES (26, 'Melisa', 'Franecki', 'lexi.grant@jacobson.com', 'f52404a7d4b1f82cd18a26f5d933abfe', 142, 1, 'A');
INSERT INTO `t_users` VALUES (27, 'Harmony', 'Stroman', 'brenda.corkery@gmail.com', 'a8a4bf1da9c6011e38839d0cb11e80aa', 142, 1, 'A');
INSERT INTO `t_users` VALUES (28, 'Olga', 'Barton', 'rosalinda.fahey@hotmail.com', 'f736699f2d25a938b767c27cdcd09931', 142, 1, 'A');
INSERT INTO `t_users` VALUES (29, 'Laura', 'Hill', 'deanna.cummings@yahoo.com', 'b9969fc827e237a3974d2e14cea38478', 142, 1, 'A');
INSERT INTO `t_users` VALUES (30, 'Diana', 'Schimmel', 'amara97@jakubowski.info', '79e3c42bfcb26e76b58f0842c765c3d9', 142, 1, 'A');
INSERT INTO `t_users` VALUES (31, 'Lauren', 'Stehr', 'inienow@boyle.com', '5c4d2267e59c55aaabecb482673891d3', 66, 1, 'A');
INSERT INTO `t_users` VALUES (32, 'Lorenz', 'Leannon', 'lia60@schaden.com', '82be585f0f8c01004f8efecc2af3a292', 66, 1, 'A');

SET FOREIGN_KEY_CHECKS = 1;
