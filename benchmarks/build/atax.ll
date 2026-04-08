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
  %1 = alloca float, i64 32, align 4
  %2 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %1, 0
  %3 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %2, ptr %1, 1
  %4 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %3, i64 0, 2
  %5 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %4, i64 32, 3, 0
  %6 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %5, i64 1, 4, 0
  %7 = alloca float, i64 32, align 4
  %8 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %7, 0
  %9 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %8, ptr %7, 1
  %10 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %9, i64 0, 2
  %11 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %10, i64 32, 3, 0
  %12 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %11, i64 1, 4, 0
  %13 = alloca float, i64 32, align 4
  %14 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %13, 0
  %15 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %14, ptr %13, 1
  %16 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %15, i64 0, 2
  %17 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %16, i64 32, 3, 0
  %18 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %17, i64 1, 4, 0
  %19 = alloca float, i64 1024, align 4
  %20 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %19, 0
  %21 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %20, ptr %19, 1
  %22 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %21, i64 0, 2
  %23 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %22, i64 32, 3, 0
  %24 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %23, i64 32, 3, 1
  %25 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %24, i64 32, 4, 0
  %26 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %25, i64 1, 4, 1
  br label %27

27:                                               ; preds = %30, %0
  %28 = phi i64 [ %36, %30 ], [ 0, %0 ]
  %29 = icmp slt i64 %28, 32
  br i1 %29, label %30, label %37

30:                                               ; preds = %27
  %31 = trunc i64 %28 to i32
  %32 = sitofp i32 %31 to float
  %33 = fdiv float %32, 3.200000e+01
  %34 = fadd float %33, 1.000000e+00
  %35 = getelementptr float, ptr %13, i64 %28
  store float %34, ptr %35, align 4
  %36 = add i64 %28, 1
  br label %27

37:                                               ; preds = %27
  br label %38

38:                                               ; preds = %56, %37
  %39 = phi i64 [ %57, %56 ], [ 0, %37 ]
  %40 = icmp slt i64 %39, 32
  br i1 %40, label %41, label %58

41:                                               ; preds = %38
  %42 = trunc i64 %39 to i32
  br label %43

43:                                               ; preds = %46, %41
  %44 = phi i64 [ %55, %46 ], [ 0, %41 ]
  %45 = icmp slt i64 %44, 32
  br i1 %45, label %46, label %56

46:                                               ; preds = %43
  %47 = trunc i64 %44 to i32
  %48 = add i32 %47, 1
  %49 = mul i32 %42, %48
  %50 = sitofp i32 %49 to float
  %51 = fdiv float %50, 3.200000e+01
  %52 = mul i64 %39, 32
  %53 = add i64 %52, %44
  %54 = getelementptr float, ptr %19, i64 %53
  store float %51, ptr %54, align 4
  %55 = add i64 %44, 1
  br label %43

56:                                               ; preds = %43
  %57 = add i64 %39, 1
  br label %38

58:                                               ; preds = %38
  call void @kernel_atax(i32 32, i32 32, ptr %19, ptr %19, i64 0, i64 32, i64 32, i64 32, i64 1, ptr %13, ptr %13, i64 0, i64 32, i64 1, ptr %7, ptr %7, i64 0, i64 32, i64 1, ptr %1, ptr %1, i64 0, i64 32, i64 1)
  br label %59

59:                                               ; preds = %63, %58
  %60 = phi i64 [ %67, %63 ], [ 0, %58 ]
  %61 = phi float [ %66, %63 ], [ 0.000000e+00, %58 ]
  %62 = icmp slt i64 %60, 32
  br i1 %62, label %63, label %68

63:                                               ; preds = %59
  %64 = getelementptr float, ptr %7, i64 %60
  %65 = load float, ptr %64, align 4
  %66 = fadd float %61, %65
  %67 = add i64 %60, 1
  br label %59

68:                                               ; preds = %59
  %69 = fcmp ogt float %61, 0.000000e+00
  %70 = xor i1 %69, true
  %71 = zext i1 %70 to i32
  ret i32 %71
}

define internal void @kernel_atax(i32 %0, i32 %1, ptr %2, ptr %3, i64 %4, i64 %5, i64 %6, i64 %7, i64 %8, ptr %9, ptr %10, i64 %11, i64 %12, i64 %13, ptr %14, ptr %15, i64 %16, i64 %17, i64 %18, ptr %19, ptr %20, i64 %21, i64 %22, i64 %23) {
  %structArg = alloca { ptr, ptr, ptr, ptr, ptr, ptr }, align 8
  %.reloaded = alloca i64, align 8
  %.reloaded30 = alloca i32, align 4
  %25 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %2, 0
  %26 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %25, ptr %3, 1
  %27 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %26, i64 %4, 2
  %28 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %27, i64 %5, 3, 0
  %29 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %28, i64 %7, 4, 0
  %30 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %29, i64 %6, 3, 1
  %31 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %30, i64 %8, 4, 1
  %32 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %9, 0
  %33 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %32, ptr %10, 1
  %34 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %33, i64 %11, 2
  %35 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %34, i64 %12, 3, 0
  %36 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %35, i64 %13, 4, 0
  %37 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %14, 0
  %38 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %37, ptr %15, 1
  %39 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %38, i64 %16, 2
  %40 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %39, i64 %17, 3, 0
  %41 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %40, i64 %18, 4, 0
  %42 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %19, 0
  %43 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %42, ptr %20, 1
  %44 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %43, i64 %21, 2
  %45 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %44, i64 %22, 3, 0
  %46 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %45, i64 %23, 4, 0
  %47 = sext i32 %1 to i64
  br label %entry

entry:                                            ; preds = %24
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  store i64 %47, ptr %.reloaded, align 8
  store i32 %0, ptr %.reloaded30, align 4
  br label %omp_parallel

omp_parallel:                                     ; preds = %entry
  %gep_.reloaded = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 0
  store ptr %.reloaded, ptr %gep_.reloaded, align 8
  %gep_.reloaded30 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 1
  store ptr %.reloaded30, ptr %gep_.reloaded30, align 8
  %gep_ = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 2
  store ptr %20, ptr %gep_, align 8
  %gep_31 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 3
  store ptr %3, ptr %gep_31, align 8
  %gep_32 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 4
  store ptr %15, ptr %gep_32, align 8
  %gep_33 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 5
  store ptr %10, ptr %gep_33, align 8
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 1, ptr @kernel_atax..omp_par, ptr %structArg)
  br label %omp.par.outlined.exit

omp.par.outlined.exit:                            ; preds = %omp_parallel
  br label %omp.par.exit.split

omp.par.exit.split:                               ; preds = %omp.par.outlined.exit
  ret void
}

; Function Attrs: norecurse nounwind
define internal void @kernel_atax..omp_par(ptr noalias %tid.addr, ptr noalias %zero.addr, ptr %0) #0 {
omp.par.entry:
  %gep_.reloaded = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 0
  %loadgep_.reloaded = load ptr, ptr %gep_.reloaded, align 8
  %gep_.reloaded30 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 1
  %loadgep_.reloaded30 = load ptr, ptr %gep_.reloaded30, align 8
  %gep_ = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 2
  %loadgep_ = load ptr, ptr %gep_, align 8
  %gep_1 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 3
  %loadgep_2 = load ptr, ptr %gep_1, align 8
  %gep_3 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 4
  %loadgep_4 = load ptr, ptr %gep_3, align 8
  %gep_5 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 5
  %loadgep_6 = load ptr, ptr %gep_5, align 8
  %tid.addr.local = alloca i32, align 4
  %1 = load i32, ptr %tid.addr, align 4
  store i32 %1, ptr %tid.addr.local, align 4
  %tid = load i32, ptr %tid.addr.local, align 4
  %2 = load i64, ptr %loadgep_.reloaded, align 8
  %3 = load i32, ptr %loadgep_.reloaded30, align 4
  %p.lastiter = alloca i32, align 4
  %p.lowerbound = alloca i64, align 8
  %p.upperbound = alloca i64, align 8
  %p.stride = alloca i64, align 8
  %p.lastiter24 = alloca i32, align 4
  %p.lowerbound25 = alloca i64, align 8
  %p.upperbound26 = alloca i64, align 8
  %p.stride27 = alloca i64, align 8
  br label %omp.par.region

omp.par.region:                                   ; preds = %omp.par.entry
  br label %omp.par.region1

omp.par.region1:                                  ; preds = %omp.par.region
  %4 = select i1 false, i64 %2, i64 0
  %5 = select i1 false, i64 0, i64 %2
  %6 = sub nsw i64 %5, %4
  %7 = icmp sle i64 %5, %4
  %8 = sub i64 %6, 1
  %9 = udiv i64 %8, 1
  %10 = add i64 %9, 1
  %11 = icmp ule i64 %6, 1
  %12 = select i1 %11, i64 1, i64 %10
  %omp_loop.tripcount = select i1 %7, i64 0, i64 %12
  br label %omp_loop.preheader

omp_loop.preheader:                               ; preds = %omp.par.region1
  store i64 0, ptr %p.lowerbound, align 8
  %13 = sub i64 %omp_loop.tripcount, 1
  store i64 %13, ptr %p.upperbound, align 8
  store i64 1, ptr %p.stride, align 8
  %omp_global_thread_num3 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_for_static_init_8u(ptr @1, i32 %omp_global_thread_num3, i32 34, ptr %p.lastiter, ptr %p.lowerbound, ptr %p.upperbound, ptr %p.stride, i64 1, i64 0)
  %14 = load i64, ptr %p.lowerbound, align 8
  %15 = load i64, ptr %p.upperbound, align 8
  %16 = sub i64 %15, %14
  %17 = add i64 %16, 1
  br label %omp_loop.header

omp_loop.header:                                  ; preds = %omp_loop.inc, %omp_loop.preheader
  %omp_loop.iv = phi i64 [ 0, %omp_loop.preheader ], [ %omp_loop.next, %omp_loop.inc ]
  br label %omp_loop.cond

omp_loop.cond:                                    ; preds = %omp_loop.header
  %omp_loop.cmp = icmp ult i64 %omp_loop.iv, %17
  br i1 %omp_loop.cmp, label %omp_loop.body, label %omp_loop.exit

omp_loop.exit:                                    ; preds = %omp_loop.cond
  call void @__kmpc_for_static_fini(ptr @1, i32 %omp_global_thread_num3)
  %omp_global_thread_num4 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num4)
  br label %omp_loop.after

omp_loop.after:                                   ; preds = %omp_loop.exit
  %18 = sext i32 %3 to i64
  %19 = select i1 false, i64 %18, i64 0
  %20 = select i1 false, i64 0, i64 %18
  %21 = sub nsw i64 %20, %19
  %22 = icmp sle i64 %20, %19
  %23 = sub i64 %21, 1
  %24 = udiv i64 %23, 1
  %25 = add i64 %24, 1
  %26 = icmp ule i64 %21, 1
  %27 = select i1 %26, i64 1, i64 %25
  %omp_loop.tripcount5 = select i1 %22, i64 0, i64 %27
  br label %omp_loop.preheader6

omp_loop.preheader6:                              ; preds = %omp_loop.after
  store i64 0, ptr %p.lowerbound25, align 8
  %28 = sub i64 %omp_loop.tripcount5, 1
  store i64 %28, ptr %p.upperbound26, align 8
  store i64 1, ptr %p.stride27, align 8
  %omp_global_thread_num28 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_for_static_init_8u(ptr @1, i32 %omp_global_thread_num28, i32 34, ptr %p.lastiter24, ptr %p.lowerbound25, ptr %p.upperbound26, ptr %p.stride27, i64 1, i64 0)
  %29 = load i64, ptr %p.lowerbound25, align 8
  %30 = load i64, ptr %p.upperbound26, align 8
  %31 = sub i64 %30, %29
  %32 = add i64 %31, 1
  br label %omp_loop.header7

omp_loop.header7:                                 ; preds = %omp_loop.inc10, %omp_loop.preheader6
  %omp_loop.iv13 = phi i64 [ 0, %omp_loop.preheader6 ], [ %omp_loop.next15, %omp_loop.inc10 ]
  br label %omp_loop.cond8

omp_loop.cond8:                                   ; preds = %omp_loop.header7
  %omp_loop.cmp14 = icmp ult i64 %omp_loop.iv13, %32
  br i1 %omp_loop.cmp14, label %omp_loop.body9, label %omp_loop.exit11

omp_loop.exit11:                                  ; preds = %omp_loop.cond8
  call void @__kmpc_for_static_fini(ptr @1, i32 %omp_global_thread_num28)
  %omp_global_thread_num29 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num29)
  br label %omp_loop.after12

omp_loop.after12:                                 ; preds = %omp_loop.exit11
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp_loop.after12
  br label %omp.par.pre_finalize

omp.par.pre_finalize:                             ; preds = %omp.region.cont
  br label %omp.par.outlined.exit.exitStub

omp_loop.body9:                                   ; preds = %omp_loop.cond8
  %33 = add i64 %omp_loop.iv13, %29
  %34 = mul i64 %33, 1
  %35 = add i64 %34, 0
  br label %omp.wsloop.region17

omp.wsloop.region17:                              ; preds = %omp_loop.body9
  %36 = getelementptr float, ptr %loadgep_, i64 %35
  store float 0.000000e+00, ptr %36, align 4
  br label %omp.wsloop.region18

omp.wsloop.region18:                              ; preds = %omp.wsloop.region19, %omp.wsloop.region17
  %37 = phi i64 [ %64, %omp.wsloop.region19 ], [ 0, %omp.wsloop.region17 ]
  %38 = icmp slt i64 %37, %2
  br i1 %38, label %omp.wsloop.region19, label %omp.wsloop.region20

omp.wsloop.region20:                              ; preds = %omp.wsloop.region18
  br label %omp.wsloop.region21

omp.wsloop.region21:                              ; preds = %omp.wsloop.region22, %omp.wsloop.region20
  %39 = phi i64 [ %52, %omp.wsloop.region22 ], [ 0, %omp.wsloop.region20 ]
  %40 = icmp slt i64 %39, %2
  br i1 %40, label %omp.wsloop.region22, label %omp.wsloop.region23

omp.wsloop.region23:                              ; preds = %omp.wsloop.region21
  br label %omp.region.cont16

omp.region.cont16:                                ; preds = %omp.wsloop.region23
  br label %omp_loop.inc10

omp_loop.inc10:                                   ; preds = %omp.region.cont16
  %omp_loop.next15 = add nuw i64 %omp_loop.iv13, 1
  br label %omp_loop.header7

omp.wsloop.region22:                              ; preds = %omp.wsloop.region21
  %41 = mul i64 %35, 32
  %42 = add i64 %41, %39
  %43 = getelementptr float, ptr %loadgep_2, i64 %42
  %44 = load float, ptr %43, align 4
  %45 = getelementptr float, ptr %loadgep_, i64 %35
  %46 = load float, ptr %45, align 4
  %47 = fmul float %44, %46
  %48 = getelementptr float, ptr %loadgep_4, i64 %39
  %49 = load float, ptr %48, align 4
  %50 = fadd float %49, %47
  %51 = getelementptr float, ptr %loadgep_4, i64 %39
  store float %50, ptr %51, align 4
  %52 = add i64 %39, 1
  br label %omp.wsloop.region21

omp.wsloop.region19:                              ; preds = %omp.wsloop.region18
  %53 = mul i64 %35, 32
  %54 = add i64 %53, %37
  %55 = getelementptr float, ptr %loadgep_2, i64 %54
  %56 = load float, ptr %55, align 4
  %57 = getelementptr float, ptr %loadgep_6, i64 %37
  %58 = load float, ptr %57, align 4
  %59 = fmul float %56, %58
  %60 = getelementptr float, ptr %loadgep_, i64 %35
  %61 = load float, ptr %60, align 4
  %62 = fadd float %61, %59
  %63 = getelementptr float, ptr %loadgep_, i64 %35
  store float %62, ptr %63, align 4
  %64 = add i64 %37, 1
  br label %omp.wsloop.region18

omp_loop.body:                                    ; preds = %omp_loop.cond
  %65 = add i64 %omp_loop.iv, %14
  %66 = mul i64 %65, 1
  %67 = add i64 %66, 0
  br label %omp.wsloop.region

omp.wsloop.region:                                ; preds = %omp_loop.body
  %68 = getelementptr float, ptr %loadgep_4, i64 %67
  store float 0.000000e+00, ptr %68, align 4
  br label %omp.region.cont2

omp.region.cont2:                                 ; preds = %omp.wsloop.region
  br label %omp_loop.inc

omp_loop.inc:                                     ; preds = %omp.region.cont2
  %omp_loop.next = add nuw i64 %omp_loop.iv, 1
  br label %omp_loop.header

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
