-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Tool Version Limit: 2022.04
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity top_PE_GMb_ROM_AUTO_1R is 
    generic(
             DataWidth     : integer := 14; 
             AddressWidth     : integer := 10; 
             AddressRange    : integer := 1024
    ); 
    port (
          address0      : in std_logic_vector(AddressWidth-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DataWidth-1 downto 0);
          reset     : in std_logic;
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of top_PE_GMb_ROM_AUTO_1R is 

signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 
type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 
signal mem : mem_array := (
    0 => "00111111111011", 1 => "01111011010000", 2 => "10101100110100", 
    3 => "10101111001000", 4 => "01101100110000", 5 => "01000011110110", 
    6 => "01100010000011", 7 => "10011000011111", 8 => "00011000110111", 
    9 => "01100011111111", 10 => "10010100000101", 11 => "01010010010010", 
    12 => "00001001001010", 13 => "01011011000001", 14 => "01110101110010", 
    15 => "10010111101110", 16 => "00010001101110", 17 => "01100100000111", 
    18 => "00011010101111", 19 => "00001111000101", 20 => "01101110111011", 
    21 => "01110111111010", 22 => "00111010011111", 23 => "01100100101010", 
    24 => "10100010101110", 25 => "01111110100100", 26 => "00011101011101", 
    27 => "00011010011000", 28 => "00010101010100", 29 => "10100001011001", 
    30 => "10011110110100", 31 => "10001111011100", 32 => "10111110110010", 
    33 => "01100001100000", 34 => "00001111100101", 35 => "00000001110101", 
    36 => "01001010101111", 37 => "01000100110111", 38 => "00011000001101", 
    39 => "01101110100000", 40 => "00101100001101", 41 => "01100100111010", 
    42 => "01000101001111", 43 => "10001010101101", 44 => "01101111101000", 
    45 => "00101000000100", 46 => "01011000100000", 47 => "00111111001010", 
    48 => "10111110011101", 49 => "00000110110000", 50 => "10100111111111", 
    51 => "00010011010101", 52 => "01110110111010", 53 => "00010111111110", 
    54 => "00111110001111", 55 => "01111010110111", 56 => "00100010000101", 
    57 => "01100010100100", 58 => "10001000010000", 59 => "01100110101010", 
    60 => "01001011101011", 61 => "00011010011010", 62 => "00000000001110", 
    63 => "00111100100000", 64 => "01010111000001", 65 => "10010010011000", 
    66 => "10111110000011", 67 => "00011111100011", 68 => "01110101110111", 
    69 => "00100100001011", 70 => "01001001000001", 71 => "01110010101100", 
    72 => "00011000010001", 73 => "00010010000100", 74 => "10000011010001", 
    75 => "10110001111101", 76 => "00001111111100", 77 => "00101110010111", 
    78 => "10101000010100", 79 => "01101110000101", 80 => "00110011110100", 
    81 => "10101111100100", 82 => "01010010100101", 83 => "10110100111010", 
    84 => "10100110001101", 85 => "10011101100110", 86 => "10010100010101", 
    87 => "01100000100100", 88 => "10010000111101", 89 => "01011111110010", 
    90 => "00110011111011", 91 => "00001101110011", 92 => "10100011100101", 
    93 => "00000111101001", 94 => "00010111011110", 95 => "00101100100011", 
    96 => "10101100110101", 97 => "10011000000001", 98 => "00101010110110", 
    99 => "10111111010001", 100 => "01001101101010", 101 => "10100011110001", 
    102 => "10011101011110", 103 => "00010010101011", 104 => "00001011011010", 
    105 => "00011011100010", 106 => "00111100001110", 107 => "00011111101110", 
    108 => "01011100000100", 109 => "10101010101010", 110 => "10001100111100", 
    111 => "01010010011010", 112 => "10001111011011", 113 => "00111000010100", 
    114 => "00111011000110", 115 => "10011111011110", 116 => "00110001101100", 
    117 => "00110110001011", 118 => "01001000111100", 119 => "00100110001110", 
    120 => "01110110111101", 121 => "10010010101010", 122 => "00001101000010", 
    123 => "01111000010111", 124 => "01101010110100", 125 => "00110101001011", 
    126 => "01010011100111", 127 => "10111111110100", 128 => "00110111111100", 
    129 => "00011011001011", 130 => "10101001000100", 131 => "10011000111011", 
    132 => "10011111100001", 133 => "00111111100110", 134 => "10111111011010", 
    135 => "10000101001101", 136 => "10100010100001", 137 => "00101010111101", 
    138 => "01110010101010", 139 => "10100101001110", 140 => "01011110011000", 
    141 => "00001110101111", 142 => "10010001110010", 143 => "00010111000101", 
    144 => "01101011010001", 145 => "10010111000100", 146 => "00111000000001", 
    147 => "01100111101001", 148 => "10111101110001", 149 => "00111111011111", 
    150 => "00111001100100", 151 => "01111000000000", 152 => "01111111111100", 
    153 => "01101011110110", 154 => "00110111001101", 155 => "10011001001111", 
    156 => "01011111001010", 157 => "00001011010111", 158 => "10011101110011", 
    159 => "01101101011011", 160 => "01101100100001", 161 => "00011110011101", 
    162 => "10011000000011", 163 => "10100100111111", 164 => "01011110101001", 
    165 => "00000101111010", 166 => "01111010111111", 167 => "10001000111011", 
    168 => "10001011000101", 169 => "10010000001101", 170 => "10001010001110", 
    171 => "01000111000111", 172 => "10010101110101", 173 => "10110110010000", 
    174 => "01110111001110", 175 => "10001001110101", 176 => "01011000110000", 
    177 => "01001101011100", 178 => "01100001101011", 179 => "10000011000100", 
    180 => "10011110101100", 181 => "10001000010011", 182 => "00100100100101", 
    183 => "00110001010111", 184 => "00010110111011", 185 => "01010101010100", 
    186 => "10000101101001", 187 => "01111001100111", 188 => "00101001011001", 
    189 => "00100100010000", 190 => "10001101001100", 191 => "01100000101100", 
    192 => "00001011100001", 193 => "00111001110010", 194 => "01001001011011", 
    195 => "01011001111001", 196 => "10001101010110", 197 => "00111001100111", 
    198 => "00000000010000", 199 => "00001110010010", 200 => "01010001000010", 
    201 => "10100100100011", 202 => "01000111001000", 203 => "00011110101100", 
    204 => "00110110110101", 205 => "10000011110100", 206 => "01110101011100", 
    207 => "01010100000101", 208 => "10100111101101", 209 => "00110011010001", 
    210 => "01101101111101", 211 => "00010000100100", 212 => "00101101001111", 
    213 => "01101111110100", 214 => "10001010110111", 215 => "01010011101101", 
    216 => "01100100001001", 217 => "10000000000101", 218 => "00101110010010", 
    219 => "01100011100111", 220 => "01001111001000", 221 => "01100111101010", 
    222 => "01010111111001", 223 => "00000100010110", 224 => "00001110100100", 
    225 => "10011111110101", 226 => "10001011011111", 227 => "01110111011010", 
    228 => "00000101011111", 229 => "10010001010010", 230 => "00000011101101", 
    231 => "01011011100010", 232 => "01111000001100", 233 => "00110001001010", 
    234 => "10111101011110", 235 => "01110110100010", 236 => "00100000000101", 
    237 => "10110000010101", 238 => "00111011011010", 239 => "01010001010100", 
    240 => "01000111111010", 241 => "00011011010100", 242 => "10110000100100", 
    243 => "00000101010100", 244 => "00111001111111", 245 => "01001000000110", 
    246 => "00000100101100", 247 => "10101011110001", 248 => "01001111001110", 
    249 => "10011101000001", 250 => "10110101100000", 251 => "10111111010111", 
    252 => "01110011111101", 253 => "10100111010011", 254 => "01011001110010", 
    255 => "01011000010110", 256 => "00111011111011", 257 => "01010110110001", 
    258 => "00010011001000", 259 => "10000100011100", 260 => "10010000010101", 
    261 => "00111100000101", 262 => "00000011111010", 263 => "10101111001001", 
    264 => "01000010000001", 265 => "01100010110110", 266 => "10010111010000", 
    267 => "10111111011110", 268 => "01000000101000", 269 => "00101011011010", 
    270 => "00001010110100", 271 => "10001001101000", 272 => "01100100001010", 
    273 => "01101000111110", 274 => "10011101111001", 275 => "10100010110010", 
    276 => "00111010101111", 277 => "01110010111100", 278 => "10110001100001", 
    279 => "10000011110001", 280 => "01100100100101", 281 => "00111001000100", 
    282 => "01100011000110", 283 => "10001100010010", 284 => "01010100001111", 
    285 => "00100011100000", 286 => "01100101001100", 287 => "01110011111000", 
    288 => "10000011100010", 289 => "10101001001000", 290 => "10111011010010", 
    291 => "01011001100101", 292 => "00001101101100", 293 => "01101101110110", 
    294 => "00100001110111", 295 => "00100110000100", 296 => "00110101110010", 
    297 => "10010000000001", 298 => "10000000001110", 299 => "01001011111010", 
    300 => "01011101001100", 301 => "00101010111010", 302 => "01110000001010", 
    303 => "00010110011010", 304 => "01110011011101", 305 => "10001010101111", 
    306 => "10100110100101", 307 => "10110011000001", 308 => "01000001111100", 
    309 => "00010110011000", 310 => "10101001010000", 311 => "01000011101000", 
    312 => "10000101101101", 313 => "00011101001011", 314 => "10010011101110", 
    315 => "00100101110000", 316 => "00111011101000", 317 => "10001101110100", 
    318 => "00001010101110", 319 => "01010100010001", 320 => "00100111011011", 
    321 => "01000011110011", 322 => "01011111100011", 323 => "00001001101011", 
    324 => "00001110101001", 325 => "00101100010010", 326 => "01111001011111", 
    327 => "00110011001111", 328 => "00100100111011", 329 => "01110101000000", 
    330 => "01011111100000", 331 => "01001111000000", 332 => "00001100111000", 
    333 => "10011111011100", 334 => "10110110101010", 335 => "00010001011001", 
    336 => "00101010100111", 337 => "10011001111000", 338 => "00001110000000", 
    339 => "00011111101100", 340 => "01001111010011", 341 => "00101001011110", 
    342 => "10100011100000", 343 => "01111011001100", 344 => "10111110001001", 
    345 => "01010100111010", 346 => "00101111111110", 347 => "01100100000000", 
    348 => "10001110101100", 349 => "10110110011000", 350 => "10111101111001", 
    351 => "01000110101000", 352 => "00010011111001", 353 => "10011000001011", 
    354 => "10110011001100", 355 => "10011011010001", 356 => "10011100110111", 
    357 => "10010111111000", 358 => "00100011010110", 359 => "10010010110111", 
    360 => "10101110111000", 361 => "00000100111011", 362 => "01000110011111", 
    363 => "00010010000110", 364 => "01011110101101", 365 => "01101001011111", 
    366 => "10111001011001", 367 => "00000101100101", 368 => "01110011000111", 
    369 => "01000111000110", 370 => "00001111010111", 371 => "10000101010110", 
    372 => "10000010100000", 373 => "10011110001110", 374 => "01110101101010", 
    375 => "10010000100101", 376 => "01000100001111", 377 => "01010001100101", 
    378 => "00111110011111", 379 => "10001001001001", 380 => "00110001011001", 
    381 => "01101101001110", 382 => "01000000100010", 383 => "10110110000100", 
    384 => "00110100101110", 385 => "10110011010101", 386 => "00011011011001", 
    387 => "00000100100100", 388 => "10000111101001", 389 => "00101011110110", 
    390 => "10100010001010", 391 => "10111110011100", 392 => "01011010101000", 
    393 => "10111000100011", 394 => "00110001101101", 395 => "00011111000100", 
    396 => "00010000000000", 397 => "10010001111100", 398 => "00100110101101", 
    399 => "10101010110000", 400 => "01000111100110", 401 => "01101001011110", 
    402 => "00111000100011", 403 => "01010101111111", 404 => "01010001110001", 
    405 => "00100110011111", 406 => "10000100010110", 407 => "01110111100010", 
    408 => "01111100011100", 409 => "01100011111011", 410 => "00010000101111", 
    411 => "00010011111000", 412 => "00110110010010", 413 => "10101100100101", 
    414 => "00110011011011", 415 => "10110001010000", 416 => "10000100110110", 
    417 => "10010100000110", 418 => "10011001101101", 419 => "00010011100101", 
    420 => "00011101000001", 421 => "01100001011001", 422 => "01001001110000", 
    423 => "10110100101001", 424 => "01011110010010", 425 => "10011001011001", 
    426 => "00110100001011", 427 => "00011100000101", 428 => "00101100111111", 
    429 => "01100001100010", 430 => "01010001010000", 431 => "00100001000010", 
    432 => "01111100011010", 433 => "10010010001001", 434 => "10110001100011", 
    435 => "01010101100011", 436 => "01011111000100", 437 => "10010110000001", 
    438 => "01000000001100", 439 => "01110010011011", 440 => "10100011000110", 
    441 => "10010011111111", 442 => "00010011110111", 443 => "00000110011000", 
    444 => "01101011111111", 445 => "00110000000111", 446 => "00000101101000", 
    447 => "10000001010100", 448 => "10110100001111", 449 => "10001111000100", 
    450 => "10001101011001", 451 => "10110100010011", 452 => "00001101010010", 
    453 => "10000110101001", 454 => "00001100010000", 455 => "01111011101111", 
    456 => "10000010001110", 457 => "10111110001010", 458 => "00011100110110", 
    459 => "10011111100101", 460 => "10111110011000", 461 => "01111010010011", 
    462 => "10111001111111", 463 => "01010111100000", 464 => "10011000110011", 
    465 => "00001111110100", 466 => "00001011010001", 467 => "00101011100000", 
    468 => "01101000010100", 469 => "01100110011000", 470 => "01010011100100", 
    471 => "01000101001000", 472 => "01101010100000", 473 => "10000011010101", 
    474 => "10011011100111", 475 => "01010000011110", 476 => "00100100110100", 
    477 => "01010110110000", 478 => "01010010010011", 479 => "00010100110101", 
    480 => "10001001100001", 481 => "10010110111101", 482 => "01110010001100", 
    483 => "01011010011100", 484 => "01001100101110", 485 => "00001110001101", 
    486 => "10110101011101", 487 => "01000100101011", 488 => "10000000101110", 
    489 => "01101000011110", 490 => "01000011001110", 491 => "00101111100100", 
    492 => "00100011101101", 493 => "10111111011001", 494 => "00011110101011", 
    495 => "10010000000000", 496 => "01000011001000", 497 => "10111010001110", 
    498 => "00001010110111", 499 => "01000100010011", 500 => "10011001000001", 
    501 => "01001100010100", 502 => "00100101101011", 503 => "10011111110110", 
    504 => "00101001011010", 505 => "00001101001001", 506 => "00111100110010", 
    507 => "10011111110111", 508 => "01110001010000", 509 => "10000100111001", 
    510 => "10101110111100", 511 => "01101000100000", 512 => "00111111011011", 
    513 => "01011110101100", 514 => "00111001100110", 515 => "01001001110010", 
    516 => "10111001001101", 517 => "01011010111000", 518 => "01101110010010", 
    519 => "01101011010100", 520 => "10101110000001", 521 => "01111011110110", 
    522 => "01001100011110", 523 => "10111111111100", 524 => "01000000000110", 
    525 => "00111101000100", 526 => "00111000011010", 527 => "01100101111101", 
    528 => "01111100000010", 529 => "01111100101110", 530 => "10111011001001", 
    531 => "01101001100011", 532 => "00001000011001", 533 => "01000111010010", 
    534 => "00011001010111", 535 => "10000000100011", 536 => "10110010111101", 
    537 => "01110101111000", 538 => "00001110001010", 539 => "10111000101000", 
    540 => "10010101001100", 541 => "10101001101010", 542 => "10010111100111", 
    543 => "00101011111111", 544 => "10110111011000", 545 => "01101010011101", 
    546 => "01101101000011", 547 => "00001100110011", 548 => "10001011000111", 
    549 => "01100001111111", 550 => "10101001011011", 551 => "00000101011100", 
    552 => "01110101011010", 553 => "10000010010011", 554 => "01100100100111", 
    555 => "00001010110110", 556 => "00001101010100", 557 => "01011000011011", 
    558 => "00101011011101", 559 => "00111010000100", 560 => "10110101000101", 
    561 => "00101111010000", 562 => "00010111110011", 563 => "10000111010011", 
    564 => "01000000010010", 565 => "10100111110010", 566 => "00110011100111", 
    567 => "01011011111101", 568 => "00101110100010", 569 => "01110001111001", 
    570 => "10111001101100", 571 => "10001110100011", 572 => "10010001101011", 
    573 => "10111000110110", 574 => "00000001100010", 575 => "00100111011110", 
    576 => "00100001000100", 577 => "01000000100011", 578 => "10110010001111", 
    579 => "00011100110100", 580 => "00111000111101", 581 => "00111101001100", 
    582 => "01111111000101", 583 => "00100010110000", 584 => "10101001110111", 
    585 => "01111110011100", 586 => "10010110110011", 587 => "01011101100101", 
    588 => "01101111100100", 589 => "10000100100000", 590 => "00011010000110", 
    591 => "00000010011111", 592 => "10101010101011", 593 => "01001100110110", 
    594 => "00000010000000", 595 => "01110010010000", 596 => "00001011010101", 
    597 => "10001111000101", 598 => "01001110001110", 599 => "01100011111001", 
    600 => "00110110100110", 601 => "01011110011011", 602 => "10101011011100", 
    603 => "01100000100101", 604 => "10111000111110", 605 => "00110101011111", 
    606 => "10100100010010", 607 => "01110111110100", 608 => "00111001101101", 
    609 => "01101000000010", 610 => "01101011111001", 611 => "10111010110001", 
    612 => "10011111100100", 613 => "10111010010010", 614 => "10001110001101", 
    615 => "10000010101101", 616 => "01001111110110", 617 => "00000000101101", 
    618 => "00100101100000", 619 => "00011110000001", 620 => "01000100011001", 
    621 => "00101010100000", 622 => "00011010011111", 623 => "00000000110011", 
    624 => "00101011111000", 625 => "00001010001010", 626 => "00011101101000", 
    627 => "10011100001101", 628 => "10011011110011", 629 => "10111011001100", 
    630 => "01111110100010", 631 => "01001011100001", 632 => "01000000100111", 
    633 => "01000010100001", 634 => "01011011001110", 635 => "01001010011101", 
    636 => "10101011101001", 637 => "10110100001100", 638 => "00001001001110", 
    639 => "10111110100110", 640 => "00000111100010", 641 => "10111110001101", 
    642 => "00011111010110", 643 => "01101110011000", 644 => "10011100100010", 
    645 => "00111101001000", 646 => "10111011110000", 647 => "10100100010111", 
    648 => "10110001100010", 649 => "01101100101010", 650 => "00100010100010", 
    651 => "00000100011100", 652 => "01010100100101", 653 => "01100111001001", 
    654 => "00111100011001", 655 => "10100001100011", 656 => "10101110110100", 
    657 => "01100001010111", 658 => "00001000000101", 659 => "10010101011100", 
    660 => "10110000010001", 661 => "00111100010111", 662 => "00010010111010", 
    663 => "01000111111100", 664 => "01111111100000", 665 => "10110010110111", 
    666 => "00000010011001", 667 => "01110000100100", 668 => "01011010000011", 
    669 => "01001111100001", 670 => "10010000100000", 671 => "10111101111010", 
    672 => "10110111100100", 673 => "00010101001010", 674 => "01101000010000", 
    675 => "00000010110011", 676 => "01010110011100", 677 => "00101001010110", 
    678 => "01011100110101", 679 => "10111110011001", 680 => "00001101011110", 
    681 => "00110001010110", 682 => "00000111011101", 683 => "01110001101111", 
    684 => "01011000101110", 685 => "01111011101010", 686 => "01000010011110", 
    687 => "00000100101110", 688 => "00101101001101", 689 => "10011110000010", 
    690 => "01101011101010", 691 => "10010101011000", 692 => "10010110101111", 
    693 => "10111010000001", 694 => "01000000000010", 695 => "10011001100000", 
    696 => "10100000011101", 697 => "00010101001001", 698 => "10100111011011", 
    699 => "01010011001101", 700 => "01100001101110", 701 => "00111101101111", 
    702 => "00011100001111", 703 => "01100100110001", 704 => "01010000100111", 
    705 => "00010100011100", 706 => "10000001111011", 707 => "00110101001100", 
    708 => "00011101010101", 709 => "00010011001111", 710 => "00000001110000", 
    711 => "01100011111110", 712 => "10110111001100", 713 => "10111111110000", 
    714 => "01110001110110", 715 => "00010110110011", 716 => "10111111110010", 
    717 => "10011010101000", 718 => "00110110000000", 719 => "00001100100000", 
    720 => "00010101110101", 721 => "10100110110110", 722 => "00000001100111", 
    723 => "01110011111100", 724 => "01111100101000", 725 => "00001110101000", 
    726 => "00001011111100", 727 => "00001001111000", 728 => "01111100111100", 
    729 => "10000000011111", 730 => "10000011111101", 731 => "01111001001110", 
    732 => "10101001110110", 733 => "10010101100011", 734 => "00100111001100", 
    735 => "00011110011010", 736 => "01100101111100", 737 => "10011110101110", 
    738 => "00010000010100", 739 => "01000011110010", 740 => "00100110011001", 
    741 => "00111000111001", 742 => "00011001111011", 743 => "01000000101011", 
    744 => "01001001010000", 745 => "10011000000101", 746 => "10101110001100", 
    747 => "00111101101010", 748 => "00100000100010", 749 => "01010010001101", 
    750 => "00011111110100", 751 => "10111001001010", 752 => "01110111010100", 
    753 => "10111111001100", 754 => "01010011110110", 755 => "00100101001100", 
    756 => "00010101110111", 757 => "01111000101000", 758 => "00100000110100", 
    759 => "00110010010001", 760 => "10101010100000", 761 => "10001011000010", 
    762 => "01110110011010", 763 => "10111011011011", 764 => "00101011100111", 
    765 => "00010010111111", 766 => "00110100011011", 767 => "00101010010111", 
    768 => "00100011011011", 769 => "00011111010100", 770 => "10000101111000", 
    771 => "10011111000000", 772 => "00110010001110", 773 => "00100100100001", 
    774 => "00011011010110", 775 => "01001001111001", 776 => "01001110000101", 
    777 => "01110011110111", 778 => "01100010101011", 779 => "10111100001100", 
    780 => "01000100010110", 781 => "01101111110101", 782 => "01001011101100", 
    783 => "00000011010011", 784 => "01111101000011", 785 => "10011110101111", 
    786 => "10010001001010", 787 => "10110011011001", 788 => "00011011000111", 
    789 => "00100100100000", 790 => "01011010100001", 791 => "10011010010011", 
    792 => "10000000000000", 793 => "00001111011010", 794 => "01110101100111", 
    795 => "00010101111001", 796 => "00001101100110", 797 => "00111000011111", 
    798 => "10000100010001", 799 => "00101011000100", 800 => "10011000101010", 
    801 => "00011111110010", 802 => "10011110111000", 803 => "00110011000000", 
    804 => "01011111110100", 805 => "00000000110110", 806 => "00101101000000", 
    807 => "01001010011011", 808 => "10111000011101", 809 => "00110000000010", 
    810 => "10000001011110", 811 => "10010011010100", 812 => "01001100010001", 
    813 => "01101100010101", 814 => "00010001000010", 815 => "10011100110110", 
    816 => "00101000000111", 817 => "00001011000100", 818 => "00001101111101", 
    819 => "01100101000001", 820 => "01001101100010", 821 => "10011100101000", 
    822 => "00100000101010", 823 => "01011001010110", 824 => "10100111110111", 
    825 => "00001100001100", 826 => "01001001111101", 827 => "01001000001111", 
    828 => "00100001010110", 829 => "00100000100111", 830 => "01001011000010", 
    831 => "00001101110100", 832 => "01010011111100", 833 => "01011010100011", 
    834 => "01011100110010", 835 => "01000011101101", 836 => "01100110011111", 
    837 => "01110101111101", 838 => "01010010010101", 839 => "10100110101000", 
    840 => "01000010011100", 841 => "00110010111100", 842 => "01011100011101", 
    843 => "10101000111110", 844 => "01011010001000", 845 => "10011011111111", 
    846 => "01111110100000", 847 => "01111001101111", 848 => "01101010010000", 
    849 => "01110101000011", 850 => "01100010000000", 851 => "00011101110011", 
    852 => "10101011000011", 853 => "01100010010001", 854 => "10111000011011", 
    855 => "01011110010000", 856 => "10110010111001", 857 => "00010010010011", 
    858 => "10001111110001", 859 => "01111011111101", 860 => "00100110101111", 
    861 => "01111100100010", 862 => "10110001001001", 863 => "01101110010110", 
    864 => "10001011001111", 865 => "01101001001000", 866 => "01100110001110", 
    867 => "01111110110010", 868 => "10001001111100", 869 => "01100111000011", 
    870 => "00110111011001", 871 => "01000011111100", 872 => "01001000000010", 
    873 => "00100010011101", 874 => "01101101010111", 875 => "01111110101010", 
    876 => "01010110111000", 877 => "10100010010110", 878 => "10010001101001", 
    879 => "00100111000011", 880 => "00100101101101", 881 => "01110001101000", 
    882 => "01101011100001", 883 => "10100101010110", 884 => "10010001011100", 
    885 => "10010011011101", 886 => "00110111100010", 887 => "00110011111110", 
    888 => "01011101100111", 889 => "10111011000001", 890 => "00110101010111", 
    891 => "10111111111011", 892 => "10011001101110", 893 => "10111100011111", 
    894 => "01000011101100", 895 => "01111010010110", 896 => "10110001000001", 
    897 => "01100111001101", 898 => "10111111101111", 899 => "00011111111100", 
    900 => "10110101011011", 901 => "01110010111001", 902 => "10101111000001", 
    903 => "10110100111110", 904 => "00111010010101", 905 => "10001011101111", 
    906 => "10011011111010", 907 => "00011001011011", 908 => "01110000000000", 
    909 => "00111101011111", 910 => "01001110111010", 911 => "00101011001010", 
    912 => "01110101001000", 913 => "10100010001111", 914 => "00001011110011", 
    915 => "00011001110110", 916 => "10111100010101", 917 => "01001101011000", 
    918 => "10011110010110", 919 => "01000100101010", 920 => "01100111000000", 
    921 => "01111011011010", 922 => "01110101001001", 923 => "10001011001000", 
    924 => "10111011111101", 925 => "00110111111101", 926 => "10100111111100", 
    927 => "01011000101010", 928 => "10100001110110", 929 => "01001100100101", 
    930 => "01110011110110", 931 => "10001001000011", 932 => "00001011000110", 
    933 => "01101001101100", 934 => "10000100001110", 935 => "01110000011001", 
    936 => "01010011111011", 937 => "01110001101010", 938 => "10101101001100", 
    939 => "00000100100010", 940 => "01111010111000", 941 => "01101010101011", 
    942 => "10111000101110", 943 => "00100111001101", 944 => "01100110110010", 
    945 => "00111110111010", 946 => "01011010101111", 947 => "00010110110010", 
    948 => "01011001011001", 949 => "01011010000010", 950 => "01000001010010", 
    951 => "00100000111001", 952 => "10110101100101", 953 => "01001011110100", 
    954 => "10001011000001", 955 => "00101100101000", 956 => "10110011110110", 
    957 => "10010000110000", 958 => "00100111011000", 959 => "10001001001000", 
    960 => "01101101100011", 961 => "00101001010111", 962 => "00011101101010", 
    963 => "01101101111111", 964 => "01011100111110", 965 => "10101110011011", 
    966 => "01010101110000", 967 => "01100010000101", 968 => "10001111011110", 
    969 => "10110011000000", 970 => "00001001111001", 971 => "10011100111110", 
    972 => "10110100100010", 973 => "01011000000001", 974 => "10010101110011", 
    975 => "00100100011101", 976 => "01101101100000", 977 => "01101110101100", 
    978 => "01001110110111", 979 => "01110000011111", 980 => "10011010001001", 
    981 => "10001100100101", 982 => "00001000111001", 983 => "01100011110110", 
    984 => "10101001011101", 985 => "10010111001111", 986 => "10000001001100", 
    987 => "10110011010000", 988 => "01000001101011", 989 => "00011111001101", 
    990 => "00000000000010", 991 => "10010001110011", 992 => "00000010100010", 
    993 => "01100000100110", 994 => "00011111010000", 995 => "00111001000001", 
    996 => "10011001000000", 997 => "01100011011011", 998 => "01110110000101", 
    999 => "01100000101011", 1000 => "10000100111110", 1001 => "10011011001111", 
    1002 => "01010110100000", 1003 => "10001100111011", 1004 => "00111001111010", 
    1005 => "10111011101001", 1006 => "00010110101100", 1007 => "00101111111011", 
    1008 => "01010101110110", 1009 => "10010111011100", 1010 => "01001100000001", 
    1011 => "01011110000011", 1012 => "01101111000010", 1013 => "10010110001010", 
    1014 => "01000111101100", 1015 => "10011110110101", 1016 => "01100001110101", 
    1017 => "01011011111111", 1018 => "00101001011100", 1019 => "10011110111100", 
    1020 => "00011000101100", 1021 => "10100010001011", 1022 => "01001000011110", 
    1023 => "10011011011101" );


begin 


memory_access_guard_0: process (address0) 
begin
      address0_tmp <= address0;
--synthesis translate_off
      if (CONV_INTEGER(address0) > AddressRange-1) then
           address0_tmp <= (others => '0');
      else 
           address0_tmp <= address0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(address0_tmp)); 
        end if;
    end if;
end process;

end rtl;

