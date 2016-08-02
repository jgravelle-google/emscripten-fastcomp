; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -instcombine -S | FileCheck %s

define i32 @test1(i8 %X) {
; CHECK-LABEL: @test1(
; CHECK-NEXT:    [[Y:%.*]] = zext i8 %X to i32
; CHECK-NEXT:    [[Z:%.*]] = and i32 [[Y]], 8
; CHECK-NEXT:    ret i32 [[Z]]
;
  %Y = zext i8 %X to i32
  %Z = and i32 %Y, 65544
  ret i32 %Z
}


