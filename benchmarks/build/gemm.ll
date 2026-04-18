; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-elf"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 66, i32 0, i32 22, ptr @0 }, align 8

declare ptr @malloc(i64)

declare void @free(ptr)

define i32 @main() {
  %1 = alloca float, i64 1024, align 4
  %2 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %1, 0
  %3 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %2, ptr %1, 1
  %4 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %3, i64 0, 2
  %5 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %4, i64 32, 3, 0
  %6 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %5, i64 32, 3, 1
  %7 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %6, i64 32, 4, 0
  %8 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %7, i64 1, 4, 1
  %9 = alloca float, i64 1024, align 4
  %10 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %9, 0
  %11 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %10, ptr %9, 1
  %12 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %11, i64 0, 2
  %13 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %12, i64 32, 3, 0
  %14 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %13, i64 32, 3, 1
  %15 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %14, i64 32, 4, 0
  %16 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %15, i64 1, 4, 1
  %17 = alloca float, i64 1024, align 4
  %18 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %17, 0
  %19 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %18, ptr %17, 1
  %20 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %19, i64 0, 2
  %21 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %20, i64 32, 3, 0
  %22 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %21, i64 32, 3, 1
  %23 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %22, i64 32, 4, 0
  %24 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %23, i64 1, 4, 1
  br label %25

25:                                               ; preds = %43, %0
  %26 = phi i64 [ %44, %43 ], [ 0, %0 ]
  %27 = icmp slt i64 %26, 32
  br i1 %27, label %28, label %45

28:                                               ; preds = %25
  %29 = trunc i64 %26 to i32
  br label %30

30:                                               ; preds = %33, %28
  %31 = phi i64 [ %42, %33 ], [ 0, %28 ]
  %32 = icmp slt i64 %31, 32
  br i1 %32, label %33, label %43

33:                                               ; preds = %30
  %34 = trunc i64 %31 to i32
  %35 = mul i32 %29, %34
  %36 = srem i32 %35, 32
  %37 = sitofp i32 %36 to float
  %38 = fdiv float %37, 3.200000e+01
  %39 = mul i64 %26, 32
  %40 = add i64 %39, %31
  %41 = getelementptr float, ptr %17, i64 %40
  store float %38, ptr %41, align 4
  %42 = add i64 %31, 1
  br label %30

43:                                               ; preds = %30
  %44 = add i64 %26, 1
  br label %25

45:                                               ; preds = %25
  br label %46

46:                                               ; preds = %65, %45
  %47 = phi i64 [ %66, %65 ], [ 0, %45 ]
  %48 = icmp slt i64 %47, 32
  br i1 %48, label %49, label %67

49:                                               ; preds = %46
  %50 = trunc i64 %47 to i32
  br label %51

51:                                               ; preds = %54, %49
  %52 = phi i64 [ %64, %54 ], [ 0, %49 ]
  %53 = icmp slt i64 %52, 32
  br i1 %53, label %54, label %65

54:                                               ; preds = %51
  %55 = trunc i64 %52 to i32
  %56 = add i32 %55, 1
  %57 = mul i32 %50, %56
  %58 = srem i32 %57, 32
  %59 = sitofp i32 %58 to float
  %60 = fdiv float %59, 3.200000e+01
  %61 = mul i64 %47, 32
  %62 = add i64 %61, %52
  %63 = getelementptr float, ptr %9, i64 %62
  store float %60, ptr %63, align 4
  %64 = add i64 %52, 1
  br label %51

65:                                               ; preds = %51
  %66 = add i64 %47, 1
  br label %46

67:                                               ; preds = %46
  br label %68

68:                                               ; preds = %87, %67
  %69 = phi i64 [ %88, %87 ], [ 0, %67 ]
  %70 = icmp slt i64 %69, 32
  br i1 %70, label %71, label %89

71:                                               ; preds = %68
  %72 = trunc i64 %69 to i32
  br label %73

73:                                               ; preds = %76, %71
  %74 = phi i64 [ %86, %76 ], [ 0, %71 ]
  %75 = icmp slt i64 %74, 32
  br i1 %75, label %76, label %87

76:                                               ; preds = %73
  %77 = trunc i64 %74 to i32
  %78 = add i32 %77, 2
  %79 = mul i32 %72, %78
  %80 = srem i32 %79, 32
  %81 = sitofp i32 %80 to float
  %82 = fdiv float %81, 3.200000e+01
  %83 = mul i64 %69, 32
  %84 = add i64 %83, %74
  %85 = getelementptr float, ptr %1, i64 %84
  store float %82, ptr %85, align 4
  %86 = add i64 %74, 1
  br label %73

87:                                               ; preds = %73
  %88 = add i64 %69, 1
  br label %68

89:                                               ; preds = %68
  call void @kernel_gemm(i32 32, i32 32, i32 32, float 1.500000e+00, float 0x3FF3333340000000, ptr %17, ptr %17, i64 0, i64 32, i64 32, i64 32, i64 1, ptr %9, ptr %9, i64 0, i64 32, i64 32, i64 32, i64 1, ptr %1, ptr %1, i64 0, i64 32, i64 32, i64 32, i64 1)
  br label %90

90:                                               ; preds = %106, %89
  %91 = phi i64 [ %107, %106 ], [ 0, %89 ]
  %92 = phi float [ %97, %106 ], [ 0.000000e+00, %89 ]
  %93 = icmp slt i64 %91, 32
  br i1 %93, label %94, label %108

94:                                               ; preds = %90
  br label %95

95:                                               ; preds = %99, %94
  %96 = phi i64 [ %105, %99 ], [ 0, %94 ]
  %97 = phi float [ %104, %99 ], [ %92, %94 ]
  %98 = icmp slt i64 %96, 32
  br i1 %98, label %99, label %106

99:                                               ; preds = %95
  %100 = mul i64 %91, 32
  %101 = add i64 %100, %96
  %102 = getelementptr float, ptr %17, i64 %101
  %103 = load float, ptr %102, align 4
  %104 = fadd float %97, %103
  %105 = add i64 %96, 1
  br label %95

106:                                              ; preds = %95
  %107 = add i64 %91, 1
  br label %90

108:                                              ; preds = %90
  %109 = fcmp ogt float %92, 0.000000e+00
  %110 = xor i1 %109, true
  %111 = zext i1 %110 to i32
  ret i32 %111
}

define internal void @kernel_gemm(i32 %0, i32 %1, i32 %2, float %3, float %4, ptr %5, ptr %6, i64 %7, i64 %8, i64 %9, i64 %10, i64 %11, ptr %12, ptr %13, i64 %14, i64 %15, i64 %16, i64 %17, i64 %18, ptr %19, ptr %20, i64 %21, i64 %22, i64 %23, i64 %24, i64 %25) {
  %structArg = alloca { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, align 8
  %.reloaded = alloca i32, align 4
  %.reloaded14 = alloca i64, align 8
  %.reloaded15 = alloca i64, align 8
  %.reloaded16 = alloca float, align 4
  %.reloaded17 = alloca float, align 4
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
  %48 = sext i32 %1 to i64
  %49 = sext i32 %2 to i64
  br label %entry

entry:                                            ; preds = %26
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  store i32 %0, ptr %.reloaded, align 4
  store i64 %48, ptr %.reloaded14, align 8
  store i64 %49, ptr %.reloaded15, align 8
  store float %3, ptr %.reloaded16, align 4
  store float %4, ptr %.reloaded17, align 4
  br label %omp_parallel

omp_parallel:                                     ; preds = %entry
  %gep_.reloaded = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 0
  store ptr %.reloaded, ptr %gep_.reloaded, align 8
  %gep_.reloaded14 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 1
  store ptr %.reloaded14, ptr %gep_.reloaded14, align 8
  %gep_.reloaded15 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 2
  store ptr %.reloaded15, ptr %gep_.reloaded15, align 8
  %gep_.reloaded16 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 3
  store ptr %.reloaded16, ptr %gep_.reloaded16, align 8
  %gep_.reloaded17 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 4
  store ptr %.reloaded17, ptr %gep_.reloaded17, align 8
  %gep_ = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 5
  store ptr %13, ptr %gep_, align 8
  %gep_18 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 6
  store ptr %20, ptr %gep_18, align 8
  %gep_19 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 7
  store ptr %6, ptr %gep_19, align 8
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 1, ptr @kernel_gemm..omp_par, ptr %structArg)
  br label %omp.par.outlined.exit

omp.par.outlined.exit:                            ; preds = %omp_parallel
  br label %omp.par.exit.split

omp.par.exit.split:                               ; preds = %omp.par.outlined.exit
  ret void
}

; Function Attrs: norecurse nounwind
define internal void @kernel_gemm..omp_par(ptr noalias %tid.addr, ptr noalias %zero.addr, ptr %0) #0 {
omp.par.entry:
  %gep_.reloaded = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 0
  %loadgep_.reloaded = load ptr, ptr %gep_.reloaded, align 8
  %gep_.reloaded14 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 1
  %loadgep_.reloaded14 = load ptr, ptr %gep_.reloaded14, align 8
  %gep_.reloaded15 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 2
  %loadgep_.reloaded15 = load ptr, ptr %gep_.reloaded15, align 8
  %gep_.reloaded16 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 3
  %loadgep_.reloaded16 = load ptr, ptr %gep_.reloaded16, align 8
  %gep_.reloaded17 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 4
  %loadgep_.reloaded17 = load ptr, ptr %gep_.reloaded17, align 8
  %gep_ = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 5
  %loadgep_ = load ptr, ptr %gep_, align 8
  %gep_1 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 6
  %loadgep_2 = load ptr, ptr %gep_1, align 8
  %gep_3 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 7
  %loadgep_4 = load ptr, ptr %gep_3, align 8
  %tid.addr.local = alloca i32, align 4
  %1 = load i32, ptr %tid.addr, align 4
  store i32 %1, ptr %tid.addr.local, align 4
  %tid = load i32, ptr %tid.addr.local, align 4
  %2 = load i32, ptr %loadgep_.reloaded, align 4
  %3 = load i64, ptr %loadgep_.reloaded14, align 8
  %4 = load i64, ptr %loadgep_.reloaded15, align 8
  %5 = load float, ptr %loadgep_.reloaded16, align 4
  %6 = load float, ptr %loadgep_.reloaded17, align 4
  %p.lastiter = alloca i32, align 4
  %p.lowerbound = alloca i64, align 8
  %p.upperbound = alloca i64, align 8
  %p.stride = alloca i64, align 8
  br label %omp.par.region

omp.par.region:                                   ; preds = %omp.par.entry
  br label %omp.par.region1

omp.par.region1:                                  ; preds = %omp.par.region
  %7 = sext i32 %2 to i64
  %8 = select i1 false, i64 %7, i64 0
  %9 = select i1 false, i64 0, i64 %7
  %10 = sub nsw i64 %9, %8
  %11 = icmp sle i64 %9, %8
  %12 = sub i64 %10, 1
  %13 = udiv i64 %12, 1
  %14 = add i64 %13, 1
  %15 = icmp ule i64 %10, 1
  %16 = select i1 %15, i64 1, i64 %14
  %omp_loop.tripcount = select i1 %11, i64 0, i64 %16
  br label %omp_loop.preheader

omp_loop.preheader:                               ; preds = %omp.par.region1
  store i64 0, ptr %p.lowerbound, align 8
  %17 = sub i64 %omp_loop.tripcount, 1
  store i64 %17, ptr %p.upperbound, align 8
  store i64 1, ptr %p.stride, align 8
  %omp_global_thread_num12 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_for_static_init_8u(ptr @1, i32 %omp_global_thread_num12, i32 34, ptr %p.lastiter, ptr %p.lowerbound, ptr %p.upperbound, ptr %p.stride, i64 1, i64 0)
  %18 = load i64, ptr %p.lowerbound, align 8
  %19 = load i64, ptr %p.upperbound, align 8
  %20 = sub i64 %19, %18
  %21 = add i64 %20, 1
  br label %omp_loop.header

omp_loop.header:                                  ; preds = %omp_loop.inc, %omp_loop.preheader
  %omp_loop.iv = phi i64 [ 0, %omp_loop.preheader ], [ %omp_loop.next, %omp_loop.inc ]
  br label %omp_loop.cond

omp_loop.cond:                                    ; preds = %omp_loop.header
  %omp_loop.cmp = icmp ult i64 %omp_loop.iv, %21
  br i1 %omp_loop.cmp, label %omp_loop.body, label %omp_loop.exit

omp_loop.exit:                                    ; preds = %omp_loop.cond
  call void @__kmpc_for_static_fini(ptr @1, i32 %omp_global_thread_num12)
  %omp_global_thread_num13 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num13)
  br label %omp_loop.after

omp_loop.after:                                   ; preds = %omp_loop.exit
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp_loop.after
  br label %omp.par.pre_finalize

omp.par.pre_finalize:                             ; preds = %omp.region.cont
  br label %omp.par.outlined.exit.exitStub

omp_loop.body:                                    ; preds = %omp_loop.cond
  %22 = add i64 %omp_loop.iv, %18
  %23 = mul i64 %22, 1
  %24 = add i64 %23, 0
  br label %omp.wsloop.region

omp.wsloop.region:                                ; preds = %omp_loop.body
  br label %omp.wsloop.region3

omp.wsloop.region3:                               ; preds = %omp.wsloop.region4, %omp.wsloop.region
  %25 = phi i64 [ %59, %omp.wsloop.region4 ], [ 0, %omp.wsloop.region ]
  %26 = icmp slt i64 %25, %3
  br i1 %26, label %omp.wsloop.region4, label %omp.wsloop.region5

omp.wsloop.region5:                               ; preds = %omp.wsloop.region3
  br label %omp.wsloop.region6

omp.wsloop.region6:                               ; preds = %omp.wsloop.region10, %omp.wsloop.region5
  %27 = phi i64 [ %31, %omp.wsloop.region10 ], [ 0, %omp.wsloop.region5 ]
  %28 = icmp slt i64 %27, %4
  br i1 %28, label %omp.wsloop.region7, label %omp.wsloop.region11

omp.wsloop.region11:                              ; preds = %omp.wsloop.region6
  br label %omp.region.cont2

omp.region.cont2:                                 ; preds = %omp.wsloop.region11
  br label %omp_loop.inc

omp_loop.inc:                                     ; preds = %omp.region.cont2
  %omp_loop.next = add nuw i64 %omp_loop.iv, 1
  br label %omp_loop.header

omp.wsloop.region7:                               ; preds = %omp.wsloop.region6
  br label %omp.wsloop.region8

omp.wsloop.region8:                               ; preds = %omp.wsloop.region9, %omp.wsloop.region7
  %29 = phi i64 [ %50, %omp.wsloop.region9 ], [ 0, %omp.wsloop.region7 ]
  %30 = icmp slt i64 %29, %3
  br i1 %30, label %omp.wsloop.region9, label %omp.wsloop.region10

omp.wsloop.region10:                              ; preds = %omp.wsloop.region8
  %31 = add i64 %27, 1
  br label %omp.wsloop.region6

omp.wsloop.region9:                               ; preds = %omp.wsloop.region8
  %32 = mul i64 %24, 32
  %33 = add i64 %32, %27
  %34 = getelementptr float, ptr %loadgep_, i64 %33
  %35 = load float, ptr %34, align 4
  %36 = fmul float %5, %35
  %37 = mul i64 %27, 32
  %38 = add i64 %37, %29
  %39 = getelementptr float, ptr %loadgep_2, i64 %38
  %40 = load float, ptr %39, align 4
  %41 = fmul float %36, %40
  %42 = mul i64 %24, 32
  %43 = add i64 %42, %29
  %44 = getelementptr float, ptr %loadgep_4, i64 %43
  %45 = load float, ptr %44, align 4
  %46 = fadd float %45, %41
  %47 = mul i64 %24, 32
  %48 = add i64 %47, %29
  %49 = getelementptr float, ptr %loadgep_4, i64 %48
  store float %46, ptr %49, align 4
  %50 = add i64 %29, 1
  br label %omp.wsloop.region8

omp.wsloop.region4:                               ; preds = %omp.wsloop.region3
  %51 = mul i64 %24, 32
  %52 = add i64 %51, %25
  %53 = getelementptr float, ptr %loadgep_4, i64 %52
  %54 = load float, ptr %53, align 4
  %55 = fmul float %54, %6
  %56 = mul i64 %24, 32
  %57 = add i64 %56, %25
  %58 = getelementptr float, ptr %loadgep_4, i64 %57
  store float %55, ptr %58, align 4
  %59 = add i64 %25, 1
  br label %omp.wsloop.region3

omp.par.outlined.exit.exitStub:                   ; preds = %omp.par.pre_finalize
  ret void
}

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(ptr) #1

; Function Attrs: nounwind
declare void @__kmpc_for_static_init_8u(ptr, i32, i32, ptr, ptr, ptr, ptr, i64, i64) #1

; Function Attrs: nounwind
declare void @__kmpc_for_static_fini(ptr, i32) #1

; Function Attrs: convergent nounwind
declare void @__kmpc_barrier(ptr, i32) #2

; Function Attrs: nounwind
declare !callback !1 void @__kmpc_fork_call(ptr, i32, ptr, ...) #1

attributes #0 = { norecurse nounwind }
attributes #1 = { nounwind }
attributes #2 = { convergent nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{!2}
!2 = !{i64 2, i64 -1, i64 -1, i1 true}
