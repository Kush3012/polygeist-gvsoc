; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-elf"

@thread_seen = private global [8 x i32] undef

declare ptr @malloc(i64)

declare void @free(ptr)

define void @kernel_test() {
  br label %1

1:                                                ; preds = %4, %0
  %2 = phi i64 [ %6, %4 ], [ 0, %0 ]
  %3 = icmp slt i64 %2, 8
  br i1 %3, label %4, label %7

4:                                                ; preds = %1
  %5 = getelementptr i32, ptr @thread_seen, i64 %2
  store i32 1, ptr %5, align 4
  %6 = add i64 %2, 1
  br label %1

7:                                                ; preds = %1
  ret void
}

define i32 @main() {
  br label %1

1:                                                ; preds = %4, %0
  %2 = phi i64 [ %6, %4 ], [ 0, %0 ]
  %3 = icmp slt i64 %2, 8
  br i1 %3, label %4, label %7

4:                                                ; preds = %1
  %5 = getelementptr i32, ptr @thread_seen, i64 %2
  store i32 0, ptr %5, align 4
  %6 = add i64 %2, 1
  br label %1

7:                                                ; preds = %1
  br label %8

8:                                                ; preds = %11, %7
  %9 = phi i64 [ %13, %11 ], [ 0, %7 ]
  %10 = icmp slt i64 %9, 8
  br i1 %10, label %11, label %14

11:                                               ; preds = %8
  %12 = getelementptr i32, ptr @thread_seen, i64 %9
  store i32 1, ptr %12, align 4
  %13 = add i64 %9, 1
  br label %8

14:                                               ; preds = %8
  br label %15

15:                                               ; preds = %19, %14
  %16 = phi i64 [ %23, %19 ], [ 0, %14 ]
  %17 = phi i32 [ %22, %19 ], [ 0, %14 ]
  %18 = icmp slt i64 %16, 8
  br i1 %18, label %19, label %24

19:                                               ; preds = %15
  %20 = getelementptr i32, ptr @thread_seen, i64 %16
  %21 = load i32, ptr %20, align 4
  %22 = add i32 %17, %21
  %23 = add i64 %16, 1
  br label %15

24:                                               ; preds = %15
  %25 = icmp ne i32 %17, 8
  %26 = zext i1 %25 to i32
  ret i32 %26
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
