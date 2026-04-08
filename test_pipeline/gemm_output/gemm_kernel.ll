; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-elf"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @init_array(i32 %0, i32 %1, i32 %2, ptr %3, ptr %4, i64 %5, i64 %6, i64 %7, ptr %8, ptr %9, i64 %10, i64 %11, i64 %12, ptr %13, ptr %14, i64 %15, i64 %16, i64 %17, i64 %18, i64 %19, ptr %20, ptr %21, i64 %22, i64 %23, i64 %24, i64 %25, i64 %26, ptr %27, ptr %28, i64 %29, i64 %30, i64 %31, i64 %32, i64 %33) {
  %35 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %3, 0
  %36 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %35, ptr %4, 1
  %37 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %36, i64 %5, 2
  %38 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %37, i64 %6, 3, 0
  %39 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %38, i64 %7, 4, 0
  %40 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %8, 0
  %41 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %40, ptr %9, 1
  %42 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %41, i64 %10, 2
  %43 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %42, i64 %11, 3, 0
  %44 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %43, i64 %12, 4, 0
  %45 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %13, 0
  %46 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %45, ptr %14, 1
  %47 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %46, i64 %15, 2
  %48 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %47, i64 %16, 3, 0
  %49 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %48, i64 %18, 4, 0
  %50 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %49, i64 %17, 3, 1
  %51 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %50, i64 %19, 4, 1
  %52 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %20, 0
  %53 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %52, ptr %21, 1
  %54 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %53, i64 %22, 2
  %55 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %54, i64 %23, 3, 0
  %56 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %55, i64 %25, 4, 0
  %57 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %56, i64 %24, 3, 1
  %58 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %57, i64 %26, 4, 1
  %59 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %27, 0
  %60 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %59, ptr %28, 1
  %61 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %60, i64 %29, 2
  %62 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %61, i64 %30, 3, 0
  %63 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %62, i64 %32, 4, 0
  %64 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %63, i64 %31, 3, 1
  %65 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %64, i64 %33, 4, 1
  %66 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %39, 1
  %67 = getelementptr float, ptr %66, i64 0
  store float 3.241200e+04, ptr %67, align 4
  %68 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %44, 1
  %69 = getelementptr float, ptr %68, i64 0
  store float 2.123000e+03, ptr %69, align 4
  %70 = sext i32 %0 to i64
  %71 = sext i32 %1 to i64
  %72 = sitofp i32 %0 to float
  br label %73

73:                                               ; preds = %92, %34
  %74 = phi i64 [ %93, %92 ], [ 0, %34 ]
  %75 = icmp slt i64 %74, %70
  br i1 %75, label %76, label %94

76:                                               ; preds = %73
  %77 = trunc i64 %74 to i32
  %78 = sitofp i32 %77 to float
  br label %79

79:                                               ; preds = %82, %76
  %80 = phi i64 [ %91, %82 ], [ 0, %76 ]
  %81 = icmp slt i64 %80, %71
  br i1 %81, label %82, label %92

82:                                               ; preds = %79
  %83 = trunc i64 %80 to i32
  %84 = sitofp i32 %83 to float
  %85 = fmul float %78, %84
  %86 = fdiv float %85, %72
  %87 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %51, 1
  %88 = mul i64 %74, 32
  %89 = add i64 %88, %80
  %90 = getelementptr float, ptr %87, i64 %89
  store float %86, ptr %90, align 4
  %91 = add i64 %80, 1
  br label %79

92:                                               ; preds = %79
  %93 = add i64 %74, 1
  br label %73

94:                                               ; preds = %73
  %95 = sext i32 %2 to i64
  br label %96

96:                                               ; preds = %115, %94
  %97 = phi i64 [ %116, %115 ], [ 0, %94 ]
  %98 = icmp slt i64 %97, %70
  br i1 %98, label %99, label %117

99:                                               ; preds = %96
  %100 = trunc i64 %97 to i32
  %101 = sitofp i32 %100 to float
  br label %102

102:                                              ; preds = %105, %99
  %103 = phi i64 [ %114, %105 ], [ 0, %99 ]
  %104 = icmp slt i64 %103, %95
  br i1 %104, label %105, label %115

105:                                              ; preds = %102
  %106 = trunc i64 %103 to i32
  %107 = sitofp i32 %106 to float
  %108 = fmul float %101, %107
  %109 = fdiv float %108, %72
  %110 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %58, 1
  %111 = mul i64 %97, 32
  %112 = add i64 %111, %103
  %113 = getelementptr float, ptr %110, i64 %112
  store float %109, ptr %113, align 4
  %114 = add i64 %103, 1
  br label %102

115:                                              ; preds = %102
  %116 = add i64 %97, 1
  br label %96

117:                                              ; preds = %96
  br label %118

118:                                              ; preds = %137, %117
  %119 = phi i64 [ %138, %137 ], [ 0, %117 ]
  %120 = icmp slt i64 %119, %95
  br i1 %120, label %121, label %139

121:                                              ; preds = %118
  %122 = trunc i64 %119 to i32
  %123 = sitofp i32 %122 to float
  br label %124

124:                                              ; preds = %127, %121
  %125 = phi i64 [ %136, %127 ], [ 0, %121 ]
  %126 = icmp slt i64 %125, %71
  br i1 %126, label %127, label %137

127:                                              ; preds = %124
  %128 = trunc i64 %125 to i32
  %129 = sitofp i32 %128 to float
  %130 = fmul float %123, %129
  %131 = fdiv float %130, %72
  %132 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %65, 1
  %133 = mul i64 %119, 32
  %134 = add i64 %133, %125
  %135 = getelementptr float, ptr %132, i64 %134
  store float %131, ptr %135, align 4
  %136 = add i64 %125, 1
  br label %124

137:                                              ; preds = %124
  %138 = add i64 %119, 1
  br label %118

139:                                              ; preds = %118
  ret void
}

define void @kernel_gemm(i32 %0, i32 %1, i32 %2, float %3, float %4, ptr %5, ptr %6, i64 %7, i64 %8, i64 %9, i64 %10, i64 %11, ptr %12, ptr %13, i64 %14, i64 %15, i64 %16, i64 %17, i64 %18, ptr %19, ptr %20, i64 %21, i64 %22, i64 %23, i64 %24, i64 %25) {
  %27 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %5, 0
  %28 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %27, ptr %6, 1
  %29 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %28, i64 %7, 2
  %30 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %29, i64 %8, 3, 0
  %31 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %30, i64 %10, 4, 0
  %32 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %31, i64 %9, 3, 1
  %33 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %32, i64 %11, 4, 1
  %34 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %12, 0
  %35 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %34, ptr %13, 1
  %36 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %35, i64 %14, 2
  %37 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %36, i64 %15, 3, 0
  %38 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %37, i64 %17, 4, 0
  %39 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %38, i64 %16, 3, 1
  %40 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %39, i64 %18, 4, 1
  %41 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %19, 0
  %42 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %41, ptr %20, 1
  %43 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %42, i64 %21, 2
  %44 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %43, i64 %22, 3, 0
  %45 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %44, i64 %24, 4, 0
  %46 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %45, i64 %23, 3, 1
  %47 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %46, i64 %25, 4, 1
  %48 = sext i32 %0 to i64
  %49 = sext i32 %1 to i64
  %50 = sext i32 %2 to i64
  br label %51

51:                                               ; preds = %104, %26
  %52 = phi i64 [ %105, %104 ], [ 0, %26 ]
  %53 = icmp slt i64 %52, %48
  br i1 %53, label %54, label %106

54:                                               ; preds = %51
  br label %55

55:                                               ; preds = %58, %54
  %56 = phi i64 [ %69, %58 ], [ 0, %54 ]
  %57 = icmp slt i64 %56, %49
  br i1 %57, label %58, label %70

58:                                               ; preds = %55
  %59 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %33, 1
  %60 = mul i64 %52, 32
  %61 = add i64 %60, %56
  %62 = getelementptr float, ptr %59, i64 %61
  %63 = load float, ptr %62, align 4
  %64 = fmul float %63, %4
  %65 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %33, 1
  %66 = mul i64 %52, 32
  %67 = add i64 %66, %56
  %68 = getelementptr float, ptr %65, i64 %67
  store float %64, ptr %68, align 4
  %69 = add i64 %56, 1
  br label %55

70:                                               ; preds = %55
  br label %71

71:                                               ; preds = %102, %70
  %72 = phi i64 [ %103, %102 ], [ 0, %70 ]
  %73 = icmp slt i64 %72, %50
  br i1 %73, label %74, label %104

74:                                               ; preds = %71
  br label %75

75:                                               ; preds = %78, %74
  %76 = phi i64 [ %101, %78 ], [ 0, %74 ]
  %77 = icmp slt i64 %76, %49
  br i1 %77, label %78, label %102

78:                                               ; preds = %75
  %79 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %40, 1
  %80 = mul i64 %52, 32
  %81 = add i64 %80, %72
  %82 = getelementptr float, ptr %79, i64 %81
  %83 = load float, ptr %82, align 4
  %84 = fmul float %3, %83
  %85 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %47, 1
  %86 = mul i64 %72, 32
  %87 = add i64 %86, %76
  %88 = getelementptr float, ptr %85, i64 %87
  %89 = load float, ptr %88, align 4
  %90 = fmul float %84, %89
  %91 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %33, 1
  %92 = mul i64 %52, 32
  %93 = add i64 %92, %76
  %94 = getelementptr float, ptr %91, i64 %93
  %95 = load float, ptr %94, align 4
  %96 = fadd float %95, %90
  %97 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %33, 1
  %98 = mul i64 %52, 32
  %99 = add i64 %98, %76
  %100 = getelementptr float, ptr %97, i64 %99
  store float %96, ptr %100, align 4
  %101 = add i64 %76, 1
  br label %75

102:                                              ; preds = %75
  %103 = add i64 %72, 1
  br label %71

104:                                              ; preds = %71
  %105 = add i64 %52, 1
  br label %51

106:                                              ; preds = %51
  ret void
}

define i32 @main() {
  %1 = alloca float, i64 1024, align 4
  %2 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %1, 0
  %3 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %2, ptr %1, 1
  %4 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %3, i64 0, 2
  %5 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %4, i64 32, 3, 0
  %6 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %5, i64 32, 3, 1
  %7 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %6, i64 32, 4, 0
  %8 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %7, i64 1, 4, 1
  br label %9

9:                                                ; preds = %27, %0
  %10 = phi i64 [ %28, %27 ], [ 0, %0 ]
  %11 = icmp slt i64 %10, 32
  br i1 %11, label %12, label %29

12:                                               ; preds = %9
  %13 = trunc i64 %10 to i32
  %14 = sitofp i32 %13 to float
  br label %15

15:                                               ; preds = %18, %12
  %16 = phi i64 [ %26, %18 ], [ 0, %12 ]
  %17 = icmp slt i64 %16, 32
  br i1 %17, label %18, label %27

18:                                               ; preds = %15
  %19 = trunc i64 %16 to i32
  %20 = sitofp i32 %19 to float
  %21 = fmul float %14, %20
  %22 = fdiv float %21, 3.200000e+01
  %23 = mul i64 %10, 32
  %24 = add i64 %23, %16
  %25 = getelementptr float, ptr %1, i64 %24
  store float %22, ptr %25, align 4
  %26 = add i64 %16, 1
  br label %15

27:                                               ; preds = %15
  %28 = add i64 %10, 1
  br label %9

29:                                               ; preds = %9
  br label %30

30:                                               ; preds = %79, %29
  %31 = phi i64 [ %80, %79 ], [ 0, %29 ]
  %32 = icmp slt i64 %31, 32
  br i1 %32, label %33, label %81

33:                                               ; preds = %30
  br label %34

34:                                               ; preds = %37, %33
  %35 = phi i64 [ %46, %37 ], [ 0, %33 ]
  %36 = icmp slt i64 %35, 32
  br i1 %36, label %37, label %47

37:                                               ; preds = %34
  %38 = mul i64 %31, 32
  %39 = add i64 %38, %35
  %40 = getelementptr float, ptr %1, i64 %39
  %41 = load float, ptr %40, align 4
  %42 = fmul float %41, 2.123000e+03
  %43 = mul i64 %31, 32
  %44 = add i64 %43, %35
  %45 = getelementptr float, ptr %1, i64 %44
  store float %42, ptr %45, align 4
  %46 = add i64 %35, 1
  br label %34

47:                                               ; preds = %34
  %48 = trunc i64 %31 to i32
  %49 = sitofp i32 %48 to float
  br label %50

50:                                               ; preds = %77, %47
  %51 = phi i64 [ %78, %77 ], [ 0, %47 ]
  %52 = icmp slt i64 %51, 32
  br i1 %52, label %53, label %79

53:                                               ; preds = %50
  %54 = trunc i64 %51 to i32
  %55 = sitofp i32 %54 to float
  %56 = fmul float %49, %55
  %57 = fdiv float %56, 3.200000e+01
  %58 = fmul float %57, 3.241200e+04
  br label %59

59:                                               ; preds = %62, %53
  %60 = phi i64 [ %76, %62 ], [ 0, %53 ]
  %61 = icmp slt i64 %60, 32
  br i1 %61, label %62, label %77

62:                                               ; preds = %59
  %63 = trunc i64 %60 to i32
  %64 = sitofp i32 %63 to float
  %65 = fmul float %55, %64
  %66 = fdiv float %65, 3.200000e+01
  %67 = fmul float %58, %66
  %68 = mul i64 %31, 32
  %69 = add i64 %68, %60
  %70 = getelementptr float, ptr %1, i64 %69
  %71 = load float, ptr %70, align 4
  %72 = fadd float %71, %67
  %73 = mul i64 %31, 32
  %74 = add i64 %73, %60
  %75 = getelementptr float, ptr %1, i64 %74
  store float %72, ptr %75, align 4
  %76 = add i64 %60, 1
  br label %59

77:                                               ; preds = %59
  %78 = add i64 %51, 1
  br label %50

79:                                               ; preds = %50
  %80 = add i64 %31, 1
  br label %30

81:                                               ; preds = %30
  br label %82

82:                                               ; preds = %98, %81
  %83 = phi i64 [ %99, %98 ], [ 0, %81 ]
  %84 = phi float [ %89, %98 ], [ 0.000000e+00, %81 ]
  %85 = icmp slt i64 %83, 32
  br i1 %85, label %86, label %100

86:                                               ; preds = %82
  br label %87

87:                                               ; preds = %91, %86
  %88 = phi i64 [ %97, %91 ], [ 0, %86 ]
  %89 = phi float [ %96, %91 ], [ %84, %86 ]
  %90 = icmp slt i64 %88, 32
  br i1 %90, label %91, label %98

91:                                               ; preds = %87
  %92 = mul i64 %83, 32
  %93 = add i64 %92, %88
  %94 = getelementptr float, ptr %1, i64 %93
  %95 = load float, ptr %94, align 4
  %96 = fadd float %89, %95
  %97 = add i64 %88, 1
  br label %87

98:                                               ; preds = %87
  %99 = add i64 %83, 1
  br label %82

100:                                              ; preds = %82
  %101 = fptosi float %84 to i32
  ret i32 %101
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
