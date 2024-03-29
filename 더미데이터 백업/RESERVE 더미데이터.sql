-- RESERVE
-- 경미
INSERT INTO RESERVE (RESERVE_NO, RESERVE_COUNT, RESERVE_DATE, USE_DATE, START_TIME, END_TIME, PRICE, SPACE_NO, MEM_NO, RESERVE_STATUS)
VALUES (SEQ_RNO.NEXTVAL, 2, TO_DATE('20220103', 'YYYY-MM-DD'), TO_DATE('20220107', 'YYYY-MM-DD'), 10, 12, 20000, 1, 32, 'Y');

INSERT INTO RESERVE (RESERVE_NO, RESERVE_COUNT, RESERVE_DATE, USE_DATE, START_TIME, END_TIME, PRICE, SPACE_NO, MEM_NO, RESERVE_STATUS)
VALUES (SEQ_RNO.NEXTVAL, 6, TO_DATE('20220104', 'YYYY-MM-DD'), TO_DATE('20220110', 'YYYY-MM-DD'), 10, 20, 100000, 2, 33, 'Y');

INSERT INTO RESERVE (RESERVE_NO, RESERVE_COUNT, RESERVE_DATE, USE_DATE, START_TIME, END_TIME, PRICE, SPACE_NO, MEM_NO, RESERVE_STATUS)
VALUES (SEQ_RNO.NEXTVAL, 30, TO_DATE('20220110', 'YYYY-MM-DD'), TO_DATE('20220125', 'YYYY-MM-DD'), 10, 22, 300000, 3, 34, 'Y');

INSERT INTO RESERVE (RESERVE_NO, RESERVE_COUNT, RESERVE_DATE, USE_DATE, START_TIME, END_TIME, PRICE, SPACE_NO, MEM_NO, RESERVE_STATUS)
VALUES (SEQ_RNO.NEXTVAL, 3, TO_DATE('20220117', 'YYYY-MM-DD'), TO_DATE('20220123', 'YYYY-MM-DD'), 13, 15, 100000, 4, 35, 'Y');

INSERT INTO RESERVE (RESERVE_NO, RESERVE_COUNT, RESERVE_DATE, USE_DATE, START_TIME, END_TIME, PRICE, SPACE_NO, MEM_NO, RESERVE_STATUS)
VALUES (SEQ_RNO.NEXTVAL, 3, TO_DATE('20220122', 'YYYY-MM-DD'), TO_DATE('20220126', 'YYYY-MM-DD'), 15, 17, 20000, 5, 36, 'Y');

INSERT INTO RESERVE (RESERVE_NO, RESERVE_COUNT, RESERVE_DATE, USE_DATE, START_TIME, END_TIME, PRICE, SPACE_NO, MEM_NO, RESERVE_STATUS)
VALUES (SEQ_RNO.NEXTVAL, 27, TO_DATE('20220130', 'YYYY-MM-DD'), TO_DATE('20220210', 'YYYY-MM-DD'), 12, 19, 70000, 6, 37, 'Y');

INSERT INTO RESERVE (RESERVE_NO, RESERVE_COUNT, RESERVE_DATE, USE_DATE, START_TIME, END_TIME, PRICE, SPACE_NO, MEM_NO, RESERVE_STATUS)
VALUES (SEQ_RNO.NEXTVAL, 10, TO_DATE('20220201', 'YYYY-MM-DD'), TO_DATE('20220203', 'YYYY-MM-DD'), 19, 24, 100000, 7, 38, 'Y');

INSERT INTO RESERVE (RESERVE_NO, RESERVE_COUNT, RESERVE_DATE, USE_DATE, START_TIME, END_TIME, PRICE, SPACE_NO, MEM_NO, RESERVE_STATUS)
VALUES (SEQ_RNO.NEXTVAL, 3, TO_DATE('20220204', 'YYYY-MM-DD'), TO_DATE('20220205', 'YYYY-MM-DD'), 8, 18, 60000, 8, 39, 'Y');

INSERT INTO RESERVE (RESERVE_NO, RESERVE_COUNT, RESERVE_DATE, USE_DATE, START_TIME, END_TIME, PRICE, SPACE_NO, MEM_NO, RESERVE_STATUS)
VALUES (SEQ_RNO.NEXTVAL, 5, TO_DATE('20220210', 'YYYY-MM-DD'), TO_DATE('20220220', 'YYYY-MM-DD'), 9, 19, 200000, 9, 40, 'Y');

INSERT INTO RESERVE (RESERVE_NO, RESERVE_COUNT, RESERVE_DATE, USE_DATE, START_TIME, END_TIME, PRICE, SPACE_NO, MEM_NO, RESERVE_STATUS)
VALUES (SEQ_RNO.NEXTVAL, 12, TO_DATE('20220211', 'YYYY-MM-DD'), TO_DATE('20220223', 'YYYY-MM-DD'), 15, 18, 198000, 10, 32, 'Y');



-- PAYMENT
--경미
INSERT INTO PAYMENT (RECEIPT_ID, RECEIPT_URL, RESERVE_NO, PAY_METHOD)
VALUES ('63a153f9d01c7e001f87aee1', 'https://door.bootpay.co.kr/receipt/dE5OUmhZNjNGZGd4R1UzdVgvaWFpbklXWjNhTGVFSzNCdnFPdDFDcC9DWWpp%0AQT09LS1SV1ZnekNPSmI0VHI2bGtlLS04V0svMENxQlJEbW9pL0dLTS90UkJB%0APT0%3D%0A', 1, '카드');

INSERT INTO PAYMENT (RECEIPT_ID, RECEIPT_URL, RESERVE_NO, PAY_METHOD)
VALUES ('63a15559d01c7e002787b459', 'https://door.bootpay.co.kr/receipt/NUE0SGlldmt4OFVEdWZ6M1JPUXFnSVg5aGRIWGQ2SHhWNzBIYUlreVd0bEpv%0Adz09LS1jdjM3MHNidVhpdERUMFNYLS1xYUZIakFxUThpWlNuZzhvbnpNU0pn%0APT0%3D%0A', 2, '카드');

INSERT INTO PAYMENT (RECEIPT_ID, RECEIPT_URL, RESERVE_NO, PAY_METHOD)
VALUES ('63a15b92d01c7e002087ae76', 'https://door.bootpay.co.kr/receipt/YW00NGtNREM0NEJaeXhTUi9ZWGdrRGx5ZndtZlpCdU5idEMyb1o0VlVYazVY%0Adz09LS1uUkVNRU5IMU1rbjJPcEVoLS1EZDNhdzVnQjE5Wk9OOG5PVkp6MUFB%0APT0%3D%0A', 3, '카드');

INSERT INTO PAYMENT (RECEIPT_ID, RECEIPT_URL, RESERVE_NO, PAY_METHOD)
VALUES ('63a15c0ad01c7e003587b216', 'https://door.bootpay.co.kr/receipt/dm5sbGU0OTc3eFd0TE1QYy9VNHRmS2M5Mk9FQW1ISUZQVTFrUm5SWFRtaHZn%0AQT09LS1PL3FUTVViRm9XL2lvZzAwLS1vai90d3JFa2hLU1FiQ2xlcUxwQTJn%0APT0%3D%0A', 4, '카카오페이');

INSERT INTO PAYMENT (RECEIPT_ID, RECEIPT_URL, RESERVE_NO, PAY_METHOD)
VALUES ('63a15d20d01c7e003587b235', 'https://door.bootpay.co.kr/receipt/YUcveVVIb1ZDYjVPS0VqNmRRRkNXdVV3ZDlCc2RVTk9EcFZTaTRTeWZUOU54%0AQT09LS1OZUN0aGJCN1lWZ3dreUJNLS1zdHJkRDBLdkNsQVUwUlo0c2Q3OVh3%0APT0%3D%0A', 5, '카드');

INSERT INTO PAYMENT (RECEIPT_ID, RECEIPT_URL, RESERVE_NO, PAY_METHOD)
VALUES ('63a15e5ad01c7e002987b89d', 'https://door.bootpay.co.kr/receipt/L2lPK251Uk1mbnByd3lsVkppcmM3Nmw3b2dkSjZnQkJnWXN1cWtJaDBYQmor%0AUT09LS03d1U0TTRnTGJ2NnR4MzRILS1wSlNsQnBJY0xnS25oallJWDBuMFVB%0APT0%3D%0A', 6, '카드');

INSERT INTO PAYMENT (RECEIPT_ID, RECEIPT_URL, RESERVE_NO, PAY_METHOD)
VALUES ('63a15ed8d01c7e002a87bb53', 'https://door.bootpay.co.kr/receipt/TDZ3cDlvbk5hSUZSR0hDNlZIM012N1hqajJKNWJaNFdLNmpEU0d5N1BLaDl4%0AZz09LS1zbkd5anVvSFF0MHpyTDZqLS10TmkyZ1AyYisrZVF1aEcxbnlCZWJB%0APT0%3D%0A', 7, '네이버페이');

INSERT INTO PAYMENT (RECEIPT_ID, RECEIPT_URL, RESERVE_NO, PAY_METHOD)
VALUES ('63a16054d01c7e002087aec6', 'https://door.bootpay.co.kr/receipt/WHB4SFBCWUk0QjJrN0JTdkdoTjJ0NnBCSnduM3ovNjc2VFJXTFByT21Zc0Ro%0AQT09LS03WkhWM3NjUEtuWlE1MUFxLS1QdS9mRU5XY3h1d3JhaklCVFA2NHFR%0APT0%3D%0A', 8, '페이코');

INSERT INTO PAYMENT (RECEIPT_ID, RECEIPT_URL, RESERVE_NO, PAY_METHOD)
VALUES ('63a16632d01c7e002487b5cb', 'https://door.bootpay.co.kr/receipt/Qm9WVGdoUjBxRTd6WG5ScmV4MDhuZUtWTzM1bndzSWhjTHRiQjBBVC91My82%0AUT09LS1tYndjUmExS00yQW9rL0ZlLS1aYkxpRi81elQ2NlFZT3B6WHU0Mkhn%0APT0%3D%0A', 9, '카드');

INSERT INTO PAYMENT (RECEIPT_ID, RECEIPT_URL, RESERVE_NO, PAY_METHOD)
VALUES ('63a16a4ed01c7e001f87b097', 'https://door.bootpay.co.kr/receipt/dE5RMUlvQWdBZFByWnVjcEJIUmdSMU9IcU0yWS8xb2I4KzFpaWdaRGNNcld4%0AZz09LS1sL09uRkhNZHlQTWFaR0dqLS1Ic2V3NEtlcFl2VlV1alp6RVdYbGFR%0APT0%3D%0A', 10, '카드');


COMMIT;