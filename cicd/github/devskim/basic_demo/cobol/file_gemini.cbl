IDENTIFICATION DIVISION.
       PROGRAM-ID. REDEFINE-EXAMPLE.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.

      * Primary data structure (200 variables simulated with groups/arrays)
       01  WS-MAIN-DATA.
           05  WS-HEADER.
               10  WS-SYSTEM-ID         PIC X(10) VALUE 'SYSTEM001'.
               10  WS-TRANSACTION-ID    PIC 9(10) VALUE 1234567890.
           05  WS-BODY OCCURS 10 TIMES.
               10  WS-CUSTOMER-DATA.
                   15  WS-CUST-ID         PIC 9(10).
                   15  WS-CUST-NAME       PIC X(30).
                   15  WS-CUST-BALANCE    PIC S9(7)V99 COMP-3.
                   15  WS-CUST-STATUS     PIC X(1).
                       88  ACTIVE           VALUE 'A'.
                       88  INACTIVE         VALUE 'I'.
               10  WS-ACCOUNT-DATA REDEFINES WS-CUSTOMER-DATA.
                   15  WS-ACC-NUMBER      PIC 9(10).
                   15  WS-ACC-TYPE        PIC X(10).
                   15  WS-ACC-LIMIT       PIC S9(7)V99 COMP-3.
                   15  WS-ACC-STATUS      PIC X(1).
           05  WS-FOOTER.
               10  WS-TOTAL-TRANS     PIC 9(10) VALUE ZERO.
               10  WS-TOTAL-AMOUNT    PIC S9(7)V99 COMP-3 VALUE 0.

      * Additional variables with redefines
       01  WS-TEMP-DATA.
           05  WS-RAW-DATA          PIC X(100).
           05  WS-PARSED-DATA REDEFINES WS-RAW-DATA.
               10  WS-FIELD-1         PIC X(20).
               10  WS-FIELD-2         PIC X(30).
               10  WS-FIELD-3         PIC X(50).
           05  WS-DATA-BUFFER REDEFINES WS-RAW-DATA.
               10  WS-BUFFER-COUNT    PIC 9(5).
               10  WS-BUFFER-VALUES   PIC X(95).

      * More redefines for demonstration
       01  WS-FINANCIAL-DATA.
           05  WS-AMOUNT-ORIGINAL   PIC X(17).
           05  WS-AMOUNT-REDEFINED  REDEFINES WS-AMOUNT-ORIGINAL.
               10  WS-AMOUNT-PART1    PIC X(10).
               10  WS-AMOUNT-PART2    PIC X(7).
           05  WS-AMOUNT-REDEFINED-AGAIN REDEFINES WS-AMOUNT-ORIGINAL.
               10  WS-AMOUNT-NUMERIC  PIC 9(15)V99.

       PROCEDURE DIVISION.
       PROCESS-DATA.
           DISPLAY 'Processing data...'.
      * Example logic that could cause data loss
           MOVE '12345678901234567' TO WS-AMOUNT-ORIGINAL.
           MOVE WS-AMOUNT-PART1 TO WS-BUFFER-VALUES.
           MOVE WS-AMOUNT-PART2 TO WS-FIELD-3.
           MOVE 100 TO WS-BUFFER-COUNT.
           GOBACK.  *> Or STOP RUN.