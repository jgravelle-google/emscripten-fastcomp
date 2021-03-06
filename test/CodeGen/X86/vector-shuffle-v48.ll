; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=x86_64-pc-linux  -mattr=+avx2 < %s | FileCheck %s
define <32 x i8> @foo(<48 x i8>* %x0, <16 x i32> %x1, <16 x i32> %x2) {
; CHECK-LABEL: foo:
; CHECK:       # BB#0:
; CHECK-NEXT:    vmovdqu 32(%rdi), %xmm0
; CHECK-NEXT:    vmovdqu (%rdi), %ymm1
; CHECK-NEXT:    vextracti128 $1, %ymm1, %xmm2
; CHECK-NEXT:    vpextrb $0, %xmm2, %eax
; CHECK-NEXT:    vpshufb {{.*#+}} xmm1 = xmm1[0,1,3,4,6,7,9,10,12,13,15],zero,zero,zero,zero,zero
; CHECK-NEXT:    vpinsrb $11, %eax, %xmm1, %xmm1
; CHECK-NEXT:    vpextrb $2, %xmm2, %eax
; CHECK-NEXT:    vpinsrb $12, %eax, %xmm1, %xmm1
; CHECK-NEXT:    vpextrb $3, %xmm2, %eax
; CHECK-NEXT:    vpinsrb $13, %eax, %xmm1, %xmm1
; CHECK-NEXT:    vpextrb $5, %xmm2, %eax
; CHECK-NEXT:    vpinsrb $14, %eax, %xmm1, %xmm1
; CHECK-NEXT:    vpextrb $6, %xmm2, %eax
; CHECK-NEXT:    vpinsrb $15, %eax, %xmm1, %xmm1
; CHECK-NEXT:    vpextrb $1, %xmm0, %eax
; CHECK-NEXT:    vpshufb {{.*#+}} xmm2 = xmm2[8,9,11,12,14,15],zero,zero,zero,zero,zero,zero,zero,zero,zero,zero
; CHECK-NEXT:    vpinsrb $6, %eax, %xmm2, %xmm2
; CHECK-NEXT:    vpextrb $2, %xmm0, %eax
; CHECK-NEXT:    vpinsrb $7, %eax, %xmm2, %xmm2
; CHECK-NEXT:    vpextrb $4, %xmm0, %eax
; CHECK-NEXT:    vpinsrb $8, %eax, %xmm2, %xmm2
; CHECK-NEXT:    vpextrb $5, %xmm0, %eax
; CHECK-NEXT:    vpinsrb $9, %eax, %xmm2, %xmm2
; CHECK-NEXT:    vpextrb $7, %xmm0, %eax
; CHECK-NEXT:    vpinsrb $10, %eax, %xmm2, %xmm2
; CHECK-NEXT:    vpextrb $8, %xmm0, %eax
; CHECK-NEXT:    vpinsrb $11, %eax, %xmm2, %xmm2
; CHECK-NEXT:    vpextrb $10, %xmm0, %eax
; CHECK-NEXT:    vpinsrb $12, %eax, %xmm2, %xmm2
; CHECK-NEXT:    vpextrb $11, %xmm0, %eax
; CHECK-NEXT:    vpinsrb $13, %eax, %xmm2, %xmm2
; CHECK-NEXT:    vpextrb $13, %xmm0, %eax
; CHECK-NEXT:    vpinsrb $14, %eax, %xmm2, %xmm2
; CHECK-NEXT:    vpextrb $14, %xmm0, %eax
; CHECK-NEXT:    vpinsrb $15, %eax, %xmm2, %xmm0
; CHECK-NEXT:    vinserti128 $1, %xmm0, %ymm1, %ymm0
; CHECK-NEXT:    retq
  %1 = load <48 x i8>, <48 x i8>* %x0, align 1
  %2 = shufflevector <48 x i8> %1, <48 x i8> undef, <32 x i32> <i32 0, i32 1, i32 3, i32 4, i32 6, i32 7, i32 9, i32 10, i32 12, i32 13, i32 15, i32 16, i32 18, i32 19, i32 21, i32 22, i32 24, i32 25, i32 27, i32 28, i32 30, i32 31, i32 33, i32 34, i32 36, i32 37, i32 39, i32 40, i32 42, i32 43, i32 45, i32 46>
  ret <32 x i8> %2
}
