# frozen_string_literal: true

require 'stringio'

require 'point'
require 'vent'

class Vents
  def initialize
    @max_x = 0 # actual max will be set in parse_point
    @max_y = 0
  end

  def run(input)
    vents = parse(input)
    count_dangerous_intersections(vents)
  end

  private

  def count_dangerous_intersections(vents)
    seabed = Array.new(@max_x + 1) { Array.new(@max_y + 1, 0) }
    vents.each do |v|
      v.each do |p|
        seabed[p.x][p.y] += 1
      end
    end
    # puts draw_seabed(seabed, 200, 0, 400, 1000)
    seabed.sum { |column| column.sum { |cell| cell >= 2 ? 1 : 0 }}
  end

  def draw_seabed(seabed, min_x, min_y, max_x, max_y)
    io = StringIO.new
    min_y.upto(max_y) do |y|
      min_x.upto(max_x) do |x|
        io.print(seabed[x][y])
      end
      io.print("\n")
    end
    io.string
  end

  def parse(input)
    input
      .split("\n")
      .map { |vent|
        point_strings = vent.split(" -> ")
        a, b = point_strings.map { |p| parse_point(p) }
        Vent.new(a, b)
      }
  end

  def parse_point(coords)
    x, y = coords.split(',').map(&:to_i)
    @max_x = x if x > @max_x
    @max_y = y if y > @max_y
    Point.new(x, y)
  end
end

puts Vents.new.run(DATA.read)

__END__
348,742 -> 620,742
494,864 -> 494,484
193,136 -> 301,136
342,692 -> 342,538
234,525 -> 102,393
72,964 -> 847,189
639,430 -> 99,970
398,791 -> 398,187
181,144 -> 205,168
607,617 -> 416,617
98,339 -> 98,437
763,119 -> 176,119
450,848 -> 450,664
293,133 -> 293,98
308,98 -> 308,15
157,21 -> 405,269
792,471 -> 409,471
42,955 -> 956,41
895,269 -> 895,884
629,635 -> 392,635
169,23 -> 273,127
250,847 -> 250,665
709,56 -> 709,626
938,599 -> 669,868
913,46 -> 458,501
844,417 -> 844,424
178,651 -> 640,189
226,266 -> 149,266
654,421 -> 654,499
368,780 -> 368,38
183,743 -> 497,429
942,34 -> 387,589
987,461 -> 987,348
485,275 -> 330,275
33,460 -> 456,883
606,304 -> 606,628
755,170 -> 755,187
342,862 -> 250,954
866,125 -> 151,840
795,489 -> 599,685
905,525 -> 905,457
99,620 -> 99,339
899,507 -> 699,707
627,444 -> 923,444
798,80 -> 419,459
580,237 -> 580,907
947,336 -> 947,727
491,466 -> 546,411
335,221 -> 458,221
547,70 -> 407,210
520,80 -> 647,80
835,58 -> 835,300
574,239 -> 589,239
219,670 -> 219,22
512,69 -> 255,69
83,701 -> 239,701
874,109 -> 48,935
980,892 -> 159,71
154,879 -> 53,879
782,37 -> 89,730
481,736 -> 481,614
377,886 -> 569,694
777,403 -> 726,454
728,952 -> 728,972
495,643 -> 879,643
425,564 -> 187,326
443,110 -> 386,167
529,279 -> 529,103
985,983 -> 16,14
145,112 -> 877,844
914,34 -> 121,827
409,229 -> 784,229
719,86 -> 479,86
929,984 -> 218,984
985,928 -> 299,242
168,159 -> 168,743
189,784 -> 189,498
401,58 -> 390,58
47,283 -> 452,688
246,292 -> 246,461
869,901 -> 643,675
879,593 -> 108,593
707,417 -> 336,417
99,401 -> 99,502
583,764 -> 583,668
493,934 -> 493,78
643,570 -> 643,990
278,765 -> 600,443
940,437 -> 940,488
812,896 -> 812,594
727,711 -> 25,711
173,586 -> 667,92
169,879 -> 466,582
361,650 -> 361,276
725,818 -> 725,662
48,119 -> 781,852
921,62 -> 921,647
135,613 -> 135,295
702,969 -> 194,461
306,709 -> 274,709
117,182 -> 117,856
608,635 -> 608,854
448,250 -> 448,641
635,552 -> 341,552
528,432 -> 51,432
711,763 -> 987,487
43,931 -> 917,57
980,841 -> 526,387
279,412 -> 377,412
334,107 -> 509,282
164,15 -> 164,345
708,139 -> 708,846
323,930 -> 323,282
256,902 -> 922,236
586,453 -> 244,111
21,92 -> 840,911
282,888 -> 839,331
278,439 -> 712,873
110,595 -> 696,595
95,531 -> 804,531
800,206 -> 800,881
396,244 -> 396,441
334,60 -> 122,60
640,331 -> 640,467
757,126 -> 731,126
430,245 -> 932,245
160,655 -> 753,62
502,432 -> 751,432
434,378 -> 434,287
907,374 -> 552,729
548,864 -> 632,864
616,961 -> 746,831
116,316 -> 666,866
78,44 -> 950,916
873,570 -> 355,570
202,859 -> 885,176
449,348 -> 904,348
143,179 -> 760,796
478,823 -> 478,55
790,446 -> 790,257
34,888 -> 736,888
630,696 -> 437,889
350,589 -> 118,821
803,373 -> 808,373
490,778 -> 818,450
487,725 -> 487,836
794,502 -> 794,114
136,743 -> 136,634
572,103 -> 194,103
488,614 -> 528,614
18,878 -> 539,357
889,35 -> 889,271
436,419 -> 21,419
422,319 -> 422,821
176,935 -> 923,188
398,398 -> 436,436
327,45 -> 820,538
643,428 -> 890,675
743,714 -> 143,114
203,359 -> 189,359
346,672 -> 346,190
263,804 -> 263,249
93,683 -> 93,453
19,180 -> 238,399
47,941 -> 888,100
525,888 -> 236,599
624,397 -> 126,397
382,119 -> 382,981
972,753 -> 336,117
682,978 -> 48,344
639,477 -> 639,408
545,966 -> 12,966
275,234 -> 401,234
912,20 -> 101,20
54,109 -> 809,864
242,149 -> 242,283
664,353 -> 828,353
117,539 -> 26,630
794,554 -> 624,554
828,536 -> 43,536
746,717 -> 746,420
540,930 -> 224,930
862,229 -> 862,212
492,917 -> 835,574
960,496 -> 960,618
148,530 -> 148,485
415,974 -> 494,974
694,118 -> 654,158
672,210 -> 672,81
548,692 -> 668,812
891,50 -> 10,931
639,652 -> 844,652
579,522 -> 556,545
231,880 -> 170,880
443,12 -> 443,775
562,185 -> 562,984
619,313 -> 74,858
371,502 -> 642,231
969,694 -> 714,949
943,157 -> 179,921
821,305 -> 821,427
782,579 -> 874,671
378,943 -> 378,956
315,636 -> 572,893
544,357 -> 315,357
51,158 -> 16,158
151,428 -> 508,428
818,939 -> 90,939
99,396 -> 451,396
602,834 -> 695,834
974,145 -> 974,919
327,630 -> 254,630
858,166 -> 900,166
537,681 -> 564,681
672,674 -> 672,619
544,408 -> 750,614
84,664 -> 210,664
204,886 -> 469,886
475,940 -> 475,592
868,922 -> 614,922
987,939 -> 367,939
854,498 -> 956,498
863,148 -> 22,989
565,580 -> 948,197
231,952 -> 798,385
935,832 -> 113,10
631,362 -> 631,329
405,143 -> 303,143
807,831 -> 891,831
450,976 -> 450,247
488,676 -> 508,676
170,328 -> 636,794
626,815 -> 626,938
217,558 -> 708,558
598,549 -> 532,549
824,307 -> 304,307
539,932 -> 390,932
542,786 -> 435,893
735,42 -> 389,388
677,448 -> 65,448
929,915 -> 29,15
870,344 -> 870,287
187,138 -> 754,138
729,353 -> 508,132
919,821 -> 317,219
272,459 -> 272,72
599,413 -> 342,413
919,862 -> 199,142
229,476 -> 893,476
438,516 -> 150,228
914,132 -> 173,873
905,815 -> 315,815
766,136 -> 766,207
548,546 -> 451,643
836,231 -> 381,231
484,854 -> 852,854
736,209 -> 307,209
751,156 -> 809,156
659,937 -> 659,333
74,899 -> 485,488
843,329 -> 843,584
793,944 -> 910,827
67,298 -> 610,841
43,15 -> 960,932
633,527 -> 912,806
782,246 -> 716,312
30,46 -> 912,928
473,833 -> 473,189
903,506 -> 61,506
85,404 -> 85,898
944,682 -> 944,465
420,695 -> 391,666
560,110 -> 810,360
246,368 -> 25,368
399,397 -> 781,15
452,618 -> 452,340
467,854 -> 890,854
77,314 -> 77,780
523,501 -> 523,646
67,284 -> 637,284
88,13 -> 988,913
173,20 -> 844,691
667,821 -> 722,821
384,840 -> 792,432
270,36 -> 270,352
311,16 -> 311,334
736,900 -> 736,264
613,827 -> 748,962
41,81 -> 885,925
408,884 -> 756,884
380,612 -> 402,634
82,645 -> 82,708
934,331 -> 316,331
634,116 -> 634,891
942,56 -> 942,642
441,260 -> 955,774
925,980 -> 314,369
317,893 -> 577,893
362,137 -> 433,137
434,928 -> 434,623
819,18 -> 819,488
185,348 -> 615,778
895,357 -> 492,357
742,645 -> 742,151
522,855 -> 366,699
867,390 -> 57,390
95,566 -> 389,272
887,793 -> 887,871
351,251 -> 351,30
309,448 -> 865,448
190,690 -> 70,570
383,805 -> 383,607
140,157 -> 140,164
685,222 -> 705,222
192,949 -> 192,358
856,768 -> 856,967
337,344 -> 771,344
919,86 -> 53,952
137,723 -> 887,723
33,108 -> 873,948
195,690 -> 195,184
136,505 -> 136,520
509,69 -> 509,800
255,742 -> 255,740
650,105 -> 650,483
985,451 -> 268,451
68,346 -> 171,346
472,28 -> 574,28
660,308 -> 660,382
341,553 -> 341,419
430,304 -> 807,304
333,258 -> 795,258
853,637 -> 252,36
881,893 -> 237,249
552,160 -> 826,160
728,446 -> 728,905
529,326 -> 529,860
564,759 -> 564,737
533,688 -> 78,233
445,314 -> 329,198
935,597 -> 652,597
955,958 -> 174,177
178,522 -> 178,457
124,351 -> 74,351
265,840 -> 451,654
771,914 -> 771,332
72,14 -> 72,574
970,828 -> 197,55
631,744 -> 631,746
765,759 -> 119,113
260,882 -> 262,882
676,760 -> 61,145
680,168 -> 959,168
466,811 -> 466,745
566,242 -> 566,471
768,975 -> 768,75
391,550 -> 391,591
781,678 -> 771,678
731,620 -> 951,620
973,290 -> 973,664
838,691 -> 835,691
294,240 -> 378,240
390,708 -> 908,190
521,933 -> 963,933
358,46 -> 919,46
431,410 -> 431,297
833,706 -> 330,706
13,910 -> 876,910
619,567 -> 619,398
165,779 -> 165,941
21,139 -> 21,535
921,420 -> 358,420
629,111 -> 608,111
654,244 -> 654,500
982,386 -> 982,841
252,127 -> 144,235
144,518 -> 144,344
581,589 -> 130,138
927,835 -> 882,790
859,658 -> 320,119
110,326 -> 110,168
149,64 -> 917,832
651,771 -> 897,771
788,66 -> 231,623
710,608 -> 370,268
927,175 -> 778,26
957,970 -> 53,66
350,313 -> 350,192
115,505 -> 129,505
414,163 -> 182,163
874,334 -> 532,676
441,790 -> 441,976
66,162 -> 226,162
839,453 -> 310,982
63,974 -> 132,974
51,383 -> 297,137
343,954 -> 262,873
726,474 -> 637,563
449,205 -> 449,279
855,845 -> 722,845
28,750 -> 33,750
272,175 -> 212,235
428,172 -> 710,172
824,834 -> 824,557
25,864 -> 855,34
66,425 -> 84,425
456,812 -> 456,785
286,294 -> 73,294
400,329 -> 525,204
888,160 -> 888,124
879,742 -> 761,742
893,751 -> 858,786
621,765 -> 10,154
162,280 -> 162,889
96,830 -> 646,280
646,720 -> 250,324
367,586 -> 695,258
298,353 -> 566,621
813,256 -> 813,367
559,672 -> 471,672
951,187 -> 234,904
868,753 -> 80,753
91,937 -> 803,225
112,142 -> 18,236
936,281 -> 936,976
95,867 -> 753,209
421,735 -> 833,735
830,755 -> 963,755
355,272 -> 355,70
309,479 -> 309,45
951,145 -> 676,145
513,143 -> 713,143
491,565 -> 988,68
797,742 -> 596,541
581,621 -> 277,317
132,480 -> 101,480
140,72 -> 375,72
524,221 -> 897,594
694,549 -> 179,34
689,729 -> 689,527
27,953 -> 27,32
913,774 -> 913,705
669,861 -> 669,360
454,250 -> 454,344
863,95 -> 13,945
341,50 -> 341,795
863,50 -> 212,50
73,689 -> 143,689
944,20 -> 31,933
22,988 -> 873,137
798,552 -> 798,774
935,583 -> 935,393
462,176 -> 986,176
739,400 -> 972,400
441,31 -> 441,37
628,381 -> 628,339
545,345 -> 615,345
91,736 -> 373,736
825,738 -> 825,687
541,877 -> 541,569
750,739 -> 390,739
873,384 -> 873,665
597,61 -> 385,61
518,62 -> 229,62
623,192 -> 502,192
163,861 -> 732,292
748,304 -> 873,429
375,436 -> 375,655
146,228 -> 146,91
808,844 -> 243,844
174,115 -> 982,923
598,384 -> 598,956
932,736 -> 843,736
772,110 -> 883,110
298,960 -> 852,406
744,772 -> 693,823
605,639 -> 731,639
126,770 -> 732,164
13,986 -> 988,11
756,37 -> 756,164
132,900 -> 984,48
806,524 -> 331,524
84,645 -> 84,195
329,447 -> 939,447
684,566 -> 793,566
747,595 -> 747,181
293,121 -> 430,121
42,918 -> 826,918
32,312 -> 833,312
42,309 -> 42,752
332,74 -> 736,74
699,209 -> 495,209
297,113 -> 297,827
515,973 -> 515,35
774,951 -> 774,290
471,921 -> 919,921
297,282 -> 297,524
477,825 -> 477,343
220,665 -> 351,796
483,128 -> 376,128
