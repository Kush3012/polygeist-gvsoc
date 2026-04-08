; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-elf"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @gemm(i32 %0, float %1, float %2, ptr %3, ptr %4, i64 %5, i64 %6, i64 %7, i64 %8, i64 %9, ptr %10, ptr %11, i64 %12, i64 %13, i64 %14, i64 %15, i64 %16, ptr %17, ptr %18, i64 %19, i64 %20, i64 %21, i64 %22, i64 %23) {
  %25 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %3, 0
  %26 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %25, ptr %4, 1
  %27 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %26, i64 %5, 2
  %28 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %27, i64 %6, 3, 0
  %29 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %28, i64 %8, 4, 0
  %30 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %29, i64 %7, 3, 1
  %31 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %30, i64 %9, 4, 1
  %32 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %10, 0
  %33 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %32, ptr %11, 1
  %34 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %33, i64 %12, 2
  %35 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %34, i64 %13, 3, 0
  %36 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %35, i64 %15, 4, 0
  %37 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %36, i64 %14, 3, 1
  %38 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %37, i64 %16, 4, 1
  %39 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %17, 0
  %40 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %39, ptr %18, 1
  %41 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %40, i64 %19, 2
  %42 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %41, i64 %20, 3, 0
  %43 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %42, i64 %22, 4, 0
  %44 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %43, i64 %21, 3, 1
  %45 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %44, i64 %23, 4, 1
  %46 = sext i32 %0 to i64
  br label %47

47:                                               ; preds = %94, %24
  %48 = phi i64 [ %95, %94 ], [ 0, %24 ]
  %49 = icmp slt i64 %48, %46
  br i1 %49, label %50, label %96

50:                                               ; preds = %47
  br label %51

51:                                               ; preds = %92, %50
  %52 = phi i64 [ %93, %92 ], [ 0, %50 ]
  %53 = icmp slt i64 %52, %46
  br i1 %53, label %54, label %94

54:                                               ; preds = %51
  %55 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %31, 1
  %56 = mul i64 %48, 16
  %57 = add i64 %56, %52
  %58 = getelementptr float, ptr %55, i64 %57
  %59 = load float, ptr %58, align 4
  %60 = fmul float %59, %2
  %61 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %31, 1
  %62 = mul i64 %48, 16
  %63 = add i64 %62, %52
  %64 = getelementptr float, ptr %61, i64 %63
  store float %60, ptr %64, align 4
  br label %65

65:                                               ; preds = %68, %54
  %66 = phi i64 [ %91, %68 ], [ 0, %54 ]
  %67 = icmp slt i64 %66, %46
  br i1 %67, label %68, label %92

68:                                               ; preds = %65
  %69 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %38, 1
  %70 = mul i64 %48, 16
  %71 = add i64 %70, %66
  %72 = getelementptr float, ptr %69, i64 %71
  %73 = load float, ptr %72, align 4
  %74 = fmul float %1, %73
  %75 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %45, 1
  %76 = mul i64 %66, 16
  %77 = add i64 %76, %52
  %78 = getelementptr float, ptr %75, i64 %77
  %79 = load float, ptr %78, align 4
  %80 = fmul float %74, %79
  %81 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %31, 1
  %82 = mul i64 %48, 16
  %83 = add i64 %82, %52
  %84 = getelementptr float, ptr %81, i64 %83
  %85 = load float, ptr %84, align 4
  %86 = fadd float %85, %80
  %87 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %31, 1
  %88 = mul i64 %48, 16
  %89 = add i64 %88, %52
  %90 = getelementptr float, ptr %87, i64 %89
  store float %86, ptr %90, align 4
  %91 = add i64 %66, 1
  br label %65

92:                                               ; preds = %65
  %93 = add i64 %52, 1
  br label %51

94:                                               ; preds = %51
  %95 = add i64 %48, 1
  br label %47

96:                                               ; preds = %47
  ret void
}

define i32 @main() {
  %1 = alloca float, i64 256, align 4
  %2 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %1, 0
  %3 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %2, ptr %1, 1
  %4 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %3, i64 0, 2
  %5 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %4, i64 16, 3, 0
  %6 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %5, i64 16, 3, 1
  %7 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %6, i64 16, 4, 0
  %8 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %7, i64 1, 4, 1
  br label %9

9:                                                ; preds = %21, %0
  %10 = phi i64 [ %22, %21 ], [ 0, %0 ]
  %11 = icmp slt i64 %10, 16
  br i1 %11, label %12, label %23

12:                                               ; preds = %9
  br label %13

13:                                               ; preds = %16, %12
  %14 = phi i64 [ %20, %16 ], [ 0, %12 ]
  %15 = icmp slt i64 %14, 16
  br i1 %15, label %16, label %21

16:                                               ; preds = %13
  %17 = mul i64 %10, 16
  %18 = add i64 %17, %14
  %19 = getelementptr float, ptr %1, i64 %18
  store float 0.000000e+00, ptr %19, align 4
  %20 = add i64 %14, 1
  br label %13

21:                                               ; preds = %13
  %22 = add i64 %10, 1
  br label %9

23:                                               ; preds = %9
  br label %24

24:                                               ; preds = %63, %23
  %25 = phi i64 [ %64, %63 ], [ 0, %23 ]
  %26 = icmp slt i64 %25, 16
  br i1 %26, label %27, label %65

27:                                               ; preds = %24
  %28 = trunc i64 %25 to i32
  br label %29

29:                                               ; preds = %61, %27
  %30 = phi i64 [ %62, %61 ], [ 0, %27 ]
  %31 = icmp slt i64 %30, 16
  br i1 %31, label %32, label %63

32:                                               ; preds = %29
  %33 = mul i64 %25, 16
  %34 = add i64 %33, %30
  %35 = getelementptr float, ptr %1, i64 %34
  %36 = load float, ptr %35, align 4
  %37 = fmul float %36, 0.000000e+00
  %38 = mul i64 %25, 16
  %39 = add i64 %38, %30
  %40 = getelementptr float, ptr %1, i64 %39
  store float %37, ptr %40, align 4
  %41 = trunc i64 %30 to i32
  br label %42

42:                                               ; preds = %45, %32
  %43 = phi i64 [ %60, %45 ], [ 0, %32 ]
  %44 = icmp slt i64 %43, 16
  br i1 %44, label %45, label %61

45:                                               ; preds = %42
  %46 = trunc i64 %43 to i32
  %47 = add i32 %28, %46
  %48 = sitofp i32 %47 to float
  %49 = mul i32 %46, %41
  %50 = sitofp i32 %49 to float
  %51 = fmul float %48, %50
  %52 = mul i64 %25, 16
  %53 = add i64 %52, %30
  %54 = getelementptr float, ptr %1, i64 %53
  %55 = load float, ptr %54, align 4
  %56 = fadd float %55, %51
  %57 = mul i64 %25, 16
  %58 = add i64 %57, %30
  %59 = getelementptr float, ptr %1, i64 %58
  store float %56, ptr %59, align 4
  %60 = add i64 %43, 1
  br label %42

61:                                               ; preds = %42
  %62 = add i64 %30, 1
  br label %29

63:                                               ; preds = %29
  %64 = add i64 %25, 1
  br label %24

65:                                               ; preds = %24
  %66 = getelementptr float, ptr %1, i64 0
  %67 = load float, ptr %66, align 4
  %68 = fptosi float %67 to i32
  ret i32 %68
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
