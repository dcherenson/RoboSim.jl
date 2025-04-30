module RefTrajLib

using ComponentArrays
using Parameters: @unpack
using StaticArrays, Serialization
using Interpolations

include("DynamicsLibrary.jl")

m = QuadSys.m
g = QuadSys.g






#### DEMO 1 (2 Quads)'
# trajectory_params_0 = ComponentArray(
#     A = [0.5,1.0, 0.0],    # [5,5, 2.0]
#     ω = [0.4,0.5,0.], #ω = [0.5,0.5,0.],
#     ψ = [π/2, 0, 0],
#     off = [-1.2,0.2,1.5] # off
# )

# trajectory_params_1 = ComponentArray(
#     A = [0.5,1.0, 0.0],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [0.4,0.5,0.], #
#     ψ = [π/2, 0, 0],
#     off = [0.7,0.2,1.5] # off
# )



### FLYLAB DEMO 1
# trajectory_params_0 = ComponentArray(
#     A = [2.6,2.9, 0.0],    # [5,5, 2.0]
#     ω = [5/8,4/8,6/8], #ω = [0.4,0.5,0.],
#     ψ = [π/2, 0, 0],
#     off = [-0.5,-1.4,7.0] # off
# )

### FLYLAB DEMO 2
trajectory_params_0 = ComponentArray(
    A = [1.1,1.4, 0.0],    # [5,5, 2.0]
    ω = [5/8,4/8,6/8], #ω = [0.4,0.5,0.],
    ψ = [π/2, 0, 0],
    off = [-2.0, 0.0,7.0] # off
)


trajectory_params_1 = ComponentArray(
    A = [1.1,1.4, 0.0],    # [5,5, 2.0]
    ω = [5/8,4/8,6/8], #ω = [0.4,0.5,0.],
    ψ = [π/2, 0, 0],
    off = [1.0,0.0,7.0] # off
)

trajectory_params_2 = ComponentArray(
    A = [2.5,1.2, 0.0],    # [5,5, 2.0]
    ω = [5/8,4/8,6/8], #ω = [0.4,0.5,0.],
    ψ = [π/2, 0, 0],
    off = [-0.5,-3.2,7.0] # off
)

# trajectory_params_1 = ComponentArray(
#     A = [0.5, 0.5, 0.0],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [0.4,0.5,0.], #
#     ψ = [π/2, 0, 0],
#     off = [-0.2,-0.5,1.3] # off
# )






# ****** Uref is given is reduced state here with [r, p, v, ω] ******

# ======== Trajectory Library =========
# 1. lissa Jous Trajectory
# TODO
# 2. Infinity symbol

# # Reference Trajectory
# Xref = [ [5*cos(t);5*cos(t)*sin(t);1.2;zeros(10)] for t = range(-pi/2,3*pi/2 + 4*pi, length = 250)]
# for i = 1:(250-1)
#     Xref[i][8:10] = (Xref[i+1][1:3] - Xref[i][1:3])/0.1
# end

# 3. Circle
# =========================

# =========== LissaJous Trajectory (DO NOT CHANGE) ===============

# trajectory_params_1 = ComponentArray(
#     A = [2.7,2.7, 0.7],    # [5,5, 2.0]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [4.0,4.,5.] # off
# )

# trajectory_params_2 = ComponentArray(
#     A = [2.7,2.7, 0.7],    # [5,5, 2.0]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [-4.0,-4.,5.] # off
# )

# trajectory_params_3 = ComponentArray(
#     A = [2.7,2.7, 0.7],    # [5,5, 2.0] [1.0,1.0, 0.2]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [-4.0,4.,5.] # off
# )

# trajectory_params_4 = ComponentArray(
#     A = [2.7,2.7, 0.7],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [4.0,-4.,5.] # off
# )
# =================================================================



# # The whole grid
# trajectory_params = ComponentArray(
#     A = [5,5, 0.7],    # [5,5, 2.0]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [0.,0,5.] # off
# )


# # # --------------------------------------
# # The test grid 1
# trajectory_params_LJ1 = ComponentArray(
#     A = [1.5,1.5, 0.5],    # [5,5, 2.0]
#     ω = [1,2,0], #
#     ψ = [π/2, 0, 0],
#     off = [0.,0,3.] # off
# )

# # The test grid 2
# trajectory_params_LJ2 = ComponentArray(
#     A = [1.5,1.5, 0.5],    # [5,5, 2.0]
#     ω = [1,2,1], #
#     ψ = [π/2 , 0, 0],
#     off = [0.,0,3.] # off
# )


# # The test grid 3
# trajectory_params_LJ3 = ComponentArray(
#     A = [1.5,1.5, 0.5],    # [5,5, 2.0]
#     ω = [3,4,1], #
#     ψ = [π/3, 0, 0],
#     off = [0.,0,3.] # off
# )


# # The test grid 4
# trajectory_params_LJ4 = ComponentArray(
#     A = [1.5,1.5, 0.5],    # [5,5, 2.0]
#     ω = [3,4,1], #
#     ψ = [3π/4, 0, 0],
#     off = [0.,0,3.] # off
# )

# # The test grid 5
# trajectory_params_LJ5 = ComponentArray(
#     A = [1.5,1.5, 0.5],    # [5,5, 2.0]
#     ω = [1,3,1], #
#     ψ = [π/4, 0, 0],
#     off = [0.,0,3.] # off
# )


# # # The test grid 6
# # trajectory_params_LJ6 = ComponentArray(
# #     A = [5,5, 0.0],    # [5,5, 2.0]
# #     ω = [1,3,1], #
# #     ψ = [3π/4, 0, 0],
# #     off = [0.,0,5.] # off
# # )
# # # The test grid 7
# # trajectory_params_LJ7 = ComponentArray(
# #     A = [5,5, 0.0],    # [5,5, 2.0]
# #     ω = [2,3,1], #
# #     ψ = [π/4, 0, 0],
# #     off = [0.,0,5.] # off
# # )
# # # The test grid 8
# # trajectory_params_LJ8 = ComponentArray(
# #     A = [5,5, 0.0],    # [5,5, 2.0]
# #     ω = [2,3,1], #
# #     ψ = [3π/4, 0, 0],
# #     off = [0.,0,5.] # off
# # )
# # # The test grid 9
# # trajectory_params_LJ9 = ComponentArray(
# #     A = [5,5, 0.0],    # [5,5, 2.0]
# #     ω = [3,4,1], #
# #     ψ = [π/4, 0, 0],
# #     off = [0.,0,5.] # off
# # )
# # # The test grid 10
# # trajectory_params_LJ10 = ComponentArray(
# #     A = [5,5, 0.0],    # [5,5, 2.0]
# #     ω = [3,4,1], #
# #     ψ = [3π/4, 0, 0],
# #     off = [0.,0,5.] # off
# # )

# # ---- Circle trajectory ----
# # trajectory_params_1 = ComponentArray(
# #     A = [2.5,2.5, 0.0],    # [5,5, 2.0]
# #     ω = [1,1,0.], #
# #     ψ = [π/2, 0, 0],
# #     off = [3.0,3.0,1.2] # off
# # )

# # trajectory_params_0 = ComponentArray(
# #     A = [1.5,1.5, 0.0],    # [5,5, 2.0]
# #     ω = [1.2,1.0,0.], #ω = [0.5,0.5,0.],
# #     ψ = [π/2, 0, 0],
# #     off = [0.0,-0.0,1.5] # off
# # )

# # trajectory_params_1 = ComponentArray(
# #     A = [1.5,1.5, 0.0],    # [5,5, 2.0]
# #     ω = [1.0,1.1,0.], #ω = [0.5,0.5,0.],
# #     ψ = [0, π/2, 0],
# #     off = [0.0,-0.0,1.5] # off
# # )
# # trajectory_params_0 = ComponentArray(
# #     A = [1.3, 1.3, 0.0],    # Keep amplitudes within limits
# #     ω = [1.0, 1.2, 0.0],    # Different ω values
# #     ψ = [0, π/2, 0],        # Staggered phase shift
# #     off = [-0.7, 0.0, 1.5]  # Shifted to the left side
# # )

# # trajectory_params_1 = ComponentArray(
# #     A = [1.3, 1.3, 0.0],    
# #     ω = [1.2, 1.0, 0.0],  
# #     ψ = [-π/2, π/2, 0],        # Phase shift to separate in time
# #     off = [0.3, 0.0, 1.5]   # Shifted to the right side
# # )


# # trajectory_params_2 = ComponentArray(
# #     A = [2.5,2.5, 0.0],    # [5,5, 2.0]
# #     ω = [1,1,0.], #[1.5,1.5,0.]
# #     ψ = [π/2, 0, 0],
# #     off = [-3.0,3.,3.0] # off
# # )

# # trajectory_params_3 = ComponentArray(
# #     A = [2.5,2.5, 0.0],     # [5,5, 2.0]
# #     ω = [1, 1,0.], #[0.8,0.8,0.],
# #     ψ = [π/2, 0, 0],
# #     off = [-3.0,-3.0,3.0] # off
# # )

# # trajectory_params_4 = ComponentArray(
# #     A = [1.3,1.0, 0.1],    # [5,5, 2.0] [2.7,2.7, 0.7]
# #     ω = [10/8,16/8,5/8], #
# #     ψ = [π/2, 0, 0],
# #     off = [-0.2,0.,1.5] # off
# # )

# # trajectory_params_1 = ComponentArray(
# #     A = [2.0,2.0, 0.4],    # [5,5, 2.0]
# #     ω = [5/8,4/8,6/8], #
# #     ψ = [π/2, 0, 0],
# #     off = [2.0,2.,3.] # off
# # )

# # trajectory_params_2 = ComponentArray(
# #     A = [2.0,2.0, 0.4],    # [5,5, 2.0]
# #     ω = [5/8,4/8,6/8], #
# #     ψ = [π/2, 0, 0],
# #     off = [-2.0,-2.,3.] # off
# # )

# # trajectory_params_3 = ComponentArray(
# #     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [1.0,1.0, 0.2]
# #     ω = [5/8,4/8,6/8], #
# #     ψ = [π/2, 0, 0],
# #     off = [-2.0,2.,3.] # off
# # )

# # trajectory_params_4 = ComponentArray(
# #     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
# #     ω = [5/8,4/8,6/8], #
# #     ψ = [π/2, 0, 0],
# #     off = [2.0,-2.,3.] # off
# # )
# # [10/8,16/8,5/8],
# trajectory_params_5 = ComponentArray(
#     A = [1.8,1.2, 0.0],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [1.2,1.4,0.], #
#     ψ = [π/2, 0, 0],
#     off = [-0.2,0.,1.3] # off
# )

# trajectory_params_6 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [-1.0,-1.,3.] # off
# )


# trajectory_params_7 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [-1.0,1.,3.] # off
# )

# trajectory_params_8 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [1.0,-1.,3.] # off
# )


# trajectory_params_9 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [0.0,2.,3.] # off
# )

# trajectory_params_10 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [0.0,-2.,3.] # off
# )

# trajectory_params_11 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [-2.0,0.,3.] # off
# )

# trajectory_params_12 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [2.0,-0.,3.] # off
# )



# trajectory_params_13 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [0.0,3.,3.] # off
# )

# trajectory_params_14 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [0.0,-3.,3.] # off
# )

# trajectory_params_15 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [-3.0,0.,3.] # off
# )

# trajectory_params_16 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [3.0,-0.,3.] # off
# )

# # =========================

# trajectory_params_17 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [-1.0,3.,3.] # off
# )

# trajectory_params_18 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [1.0,3.,3.] # off
# )

# trajectory_params_19 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [1.0,1.0, 0.2]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [-1.0,2.,3.] # off
# )

# trajectory_params_20 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [1.0,2.,3.] # off
# )

# trajectory_params_21 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [-2.0,1.,3.] # off
# )

# trajectory_params_22 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [0.0, 1.,3.] # off
# )


# trajectory_params_23 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [2.0,1.,3.] # off
# )

# trajectory_params_24 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [-1.0,0.,3.] # off
# )


# trajectory_params_25 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [0.0,0.,3.] # off
# )

# trajectory_params_26 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [1.0, 0.,3.] # off
# )

# trajectory_params_27 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [-2.0,-1.,3.] # off
# )

# trajectory_params_28 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [0.0,-1.0,3.] # off
# )



# trajectory_params_29 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [2.0,-1.,3.] # off
# )

# trajectory_params_30 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [-1.0,-2.,3.] # off
# )

# trajectory_params_31 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [1.0,-2.,3.] # off
# )

# trajectory_params_32 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [-1.0,-3.0,3.] # off
# )

# trajectory_params_33 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [1.0,-3.0,3.] # off
# )

# trajectory_params_34 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [3.0,1.0,3.] # off
# )

# trajectory_params_35 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [3.0,-1.0,3.] # off
# )

# trajectory_params_36 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [-3.0,1.0,3.] # off
# )

# trajectory_params_37 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [-3.0,-1.0,3.] # off
# )

# trajectory_params_38 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [3.0,2.0,3.] # off
# )

# trajectory_params_39 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [-3.0,1.0,3.] # off
# )

# trajectory_params_40 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [3.0,1.0,3.] # off
# )

# trajectory_params_41 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [-4.0,0.0,3.] # off
# )

# trajectory_params_42 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [4.0,0.0,3.] # off
# )

# trajectory_params_43 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [-4.0,0.0,3.] # off
# )

# trajectory_params_44 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [-3.0,-1.0,3.] # off
# )

# trajectory_params_45 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [3.0,-1.0,3.] # off
# )

# trajectory_params_46 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [-3.0,-2.0,3.] # off
# )

# trajectory_params_47 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [3.0,-2.0,3.] # off
# )


# trajectory_params_48 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [-2.0,-3.0,3.] # off
# )

# trajectory_params_49 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [2.0,-3.0,3.] # off
# )

# trajectory_params_50 = ComponentArray(
#     A = [2.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [0.0,-4.0,3.] # off
# )
# =========================



function lissajous(t, params, D::Integer = 0)
    @unpack A, ω, ψ, off = params
    return lissajous(t, A, ω, ψ, off, D)
end


function lissajous(t, A, ω, ψ, off, D = 0)
    N = length(A)
    if D == 0
        return SVector{N}(off[i] + A[i] * sin(ω[i] * t + ψ[i]) for i = 1:N)
    else
        return SVector{N}(A[i] * ω[i]^D * sin(ω[i] * t  + π * D /2 + ψ[i]) for i = 1:N)
    end
end
# ===============================================

# trajectory_params_r1_plot = ComponentArray(
#     A = [-3.5,4.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [0.0,0.,3.] # off
# )

# trajectory_params_r1 = ComponentArray(
#     A = [1.0,2.0, 0.4],    # [5,5, 2.0]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [2.0,2.,3.] # off
# )

# trajectory_params_r2 = ComponentArray(
#     A = [2.0,1.0, 0.4],    # [5,5, 2.0]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [-2.0,-2.,3.] # off
# )

# trajectory_params_r3 = ComponentArray(
#     A = [2.0,3.0, 0.4],    # [5,5, 2.0] [1.0,1.0, 0.2]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [-2.0,2.,3.] # off
# )

# trajectory_params_r4 = ComponentArray(
#     A = [3.0,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [2.0,-2.,3.] # off
# )

# trajectory_params_r5 = ComponentArray(
#     A = [4.0,3.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [1.0,1.,3.] # off
# )

# trajectory_params_r6 = ComponentArray(
#     A = [3.0,4.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [1.0,1.,2.] # off
# )

# trajectory_params_r7 = ComponentArray(
#     A = [-2.5,-3.5, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [-1.0,1.,2.] # off
# )


# trajectory_params_r8 = ComponentArray(
#     A = [-2.0,-2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [1.0,-1.,3.] # off
# )


# trajectory_params_r9 = ComponentArray(
#     A = [-1.5,-2.5, 0.8],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [0.0,2.,3.] # off
# )

# trajectory_params_r10 = ComponentArray(
#     A = [-3.0,1.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [0.0,-2.,3.] # off
# )

# trajectory_params_r11 = ComponentArray(
#     A = [-3.7,1.3, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [-2.0,0.,3.] # off
# )

# trajectory_params_r12 = ComponentArray(
#     A = [2.3,1.7, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [2.0,-0.,2.] # off
# )

# trajectory_params_r13 = ComponentArray(
#     A = [-1.7,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [0.0,3.,4.] # off
# )

# trajectory_params_r14 = ComponentArray(
#     A = [-2.9,0.9, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [0.0,-3.,2.] # off
# )

# trajectory_params_r15 = ComponentArray(
#     A = [-3.5,4.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [-3.0,0.,3.] # off
# )

# trajectory_params_r16 = ComponentArray(
#     A = [-0.8,2.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [3.0,-0.,4.] # off
# )

# # =========================

# trajectory_params_r17 = ComponentArray(
#     A = [1.1,4.0, 0.6],    # [5,5, 2.0]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [-1.0,3.,4.] # off
# )

# trajectory_params_r18 = ComponentArray(
#     A = [-3.7,-1.5, 0.4],    # [5,5, 2.0]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [1.0,3.,2.] # off
# )

# trajectory_params_r19 = ComponentArray(
#     A = [-3.0,-2.0, 0.4],    # [5,5, 2.0] [1.0,1.0, 0.2]
#     ω = [4/8,5/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [-1.0,2.,3.] # off
# )

# trajectory_params_r20 = ComponentArray(
#     A = [-4.0,1.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [1.0,2.,3.] # off
# )


# trajectory_params_r21 = ComponentArray(
#     A = [-3.9,-1.1, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [-2.0,1.,2.] # off
# )

# trajectory_params_r22 = ComponentArray(
#     A = [3.9,1.5, 0.7],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [0.0, 1.,4.] # off
# )


# trajectory_params_r23 = ComponentArray(
#     A = [3.5,2.7, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [2.0,1.,4.] # off
# )

# trajectory_params_r24 = ComponentArray(
#     A = [-1.1,2.3, 0.7],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [-1.0,0.,2.] # off
# )


# trajectory_params_r25 = ComponentArray(
#     A = [-3.5,-1.7, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,5/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [0.0,0.,4.] # off
# )

# trajectory_params_r26 = ComponentArray(
#     A = [-3.9,2.5, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [4/8,5/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [1.0, 0.,2.] # off
# )

# trajectory_params_r27 = ComponentArray(
#     A = [-2.5,-1.9, 0.3],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [-2.0,-1.,2.] # off
# )

# trajectory_params_r28 = ComponentArray(
#     A = [1.8,-3.0, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,4/8,5/8], #
#     ψ = [π/2, 0, 0],
#     off = [0.0,-1.0,4.] # off
# )



# trajectory_params_r29 = ComponentArray(
#     A = [2.3,3.9, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,5/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [2.0,-1.,2.] # off
# )

# trajectory_params_r30 = ComponentArray(
#     A = [-1.4,2.8, 0.4],    # [5,5, 2.0] [2.7,2.7, 0.7]
#     ω = [5/8,5/8,6/8], #
#     ψ = [π/2, 0, 0],
#     off = [-1.0,-2.,4.] # off
# )

# # # For Random Trajectories 
# function get_desired_trajectory(t0, traj_type, N, dt, param_type)
    
    
#     if (traj_type == 1)
#         Xref = [zeros(12) for i=1:N]
#         for i = 1:(N)
#             ti = t0 + (i-1)*dt
#             # Desired Position
#             if param_type == 1
#                 Xref[i][1:3] = lissajous(ti, trajectory_params_r1)
#                 Xref[i][7:9] = lissajous(ti, trajectory_params_r1, 1)
#             elseif param_type == 2
#                 Xref[i][1:3] = lissajous(ti, trajectory_params_r2)
#                 Xref[i][7:9] = lissajous(ti, trajectory_params_r2, 1)
#             elseif param_type == 3
#                 Xref[i][1:3] = lissajous(ti, trajectory_params_r3)
#                 Xref[i][7:9] = lissajous(ti, trajectory_params_r3, 1)
#             elseif param_type == 4
#                 Xref[i][1:3] = lissajous(ti, trajectory_params_r4)
#                 Xref[i][7:9] = lissajous(ti, trajectory_params_r4, 1)
#             elseif param_type == 5
#                 Xref[i][1:3] = lissajous(ti, trajectory_params_r5)
#                 Xref[i][7:9] = lissajous(ti, trajectory_params_r5, 1)
#             elseif param_type == 6
#                 Xref[i][1:3] = lissajous(ti, trajectory_params_r6)
#                 Xref[i][7:9] = lissajous(ti, trajectory_params_r6, 1)
#             elseif param_type == 7
#                 Xref[i][1:3] = lissajous(ti, trajectory_params_r7)
#                 Xref[i][7:9] = lissajous(ti, trajectory_params_r7, 1)
#             elseif param_type == 8
#                 Xref[i][1:3] = lissajous(ti, trajectory_params_r8)
#                 Xref[i][7:9] = lissajous(ti, trajectory_params_r8, 1)
#             elseif param_type == 9
#                 Xref[i][1:3] = lissajous(ti, trajectory_params_r9)
#                 Xref[i][7:9] = lissajous(ti, trajectory_params_r9, 1)
#             elseif param_type == 10
#                 Xref[i][1:3] = lissajous(ti, trajectory_params_r10)
#                 Xref[i][7:9] = lissajous(ti, trajectory_params_r10, 1)
#             elseif param_type == 11
#                 Xref[i][1:3] = lissajous(ti, trajectory_params_r11)
#                 Xref[i][7:9] = lissajous(ti, trajectory_params_r11, 1)
#             elseif param_type == 12
#                 Xref[i][1:3] = lissajous(ti, trajectory_params_r12)
#                 Xref[i][7:9] = lissajous(ti, trajectory_params_r12, 1)
#             elseif param_type == 13
#                 Xref[i][1:3] = lissajous(ti, trajectory_params_r13)
#                 Xref[i][7:9] = lissajous(ti, trajectory_params_r13, 1)
#             elseif param_type == 14
#                 Xref[i][1:3] = lissajous(ti, trajectory_params_r14)
#                 Xref[i][7:9] = lissajous(ti, trajectory_params_r14, 1)
#             elseif param_type == 15
#                 Xref[i][1:3] = lissajous(ti, trajectory_params_r15)
#                 Xref[i][7:9] = lissajous(ti, trajectory_params_r15, 1)
#             elseif param_type == 16
#                 Xref[i][1:3] = lissajous(ti, trajectory_params_r16)
#                 Xref[i][7:9] = lissajous(ti, trajectory_params_r16, 1)
#             elseif param_type == 17
#                 Xref[i][1:3] = lissajous(ti, trajectory_params_r17)
#                 Xref[i][7:9] = lissajous(ti, trajectory_params_r17, 1)
#             elseif param_type == 18
#                 Xref[i][1:3] = lissajous(ti, trajectory_params_r18)
#                 Xref[i][7:9] = lissajous(ti, trajectory_params_r18, 1)
#             elseif param_type == 19
#                 Xref[i][1:3] = lissajous(ti, trajectory_params_r19)
#                 Xref[i][7:9] = lissajous(ti, trajectory_params_r19, 1)
#             elseif param_type == 20
#                 Xref[i][1:3] = lissajous(ti, trajectory_params_r20)
#                 Xref[i][7:9] = lissajous(ti, trajectory_params_r20, 1)
#             elseif param_type == 21
#                 Xref[i][1:3] = lissajous(ti, trajectory_params_r21)
#                 Xref[i][7:9] = lissajous(ti, trajectory_params_r21, 1)
#             elseif param_type == 22
#                 Xref[i][1:3] = lissajous(ti, trajectory_params_r22)
#                 Xref[i][7:9] = lissajous(ti, trajectory_params_r22, 1)
#             elseif param_type == 23
#                 Xref[i][1:3] = lissajous(ti, trajectory_params_r23)
#                 Xref[i][7:9] = lissajous(ti, trajectory_params_r23, 1)
#             elseif param_type == 24
#                 Xref[i][1:3] = lissajous(ti, trajectory_params_r24)
#                 Xref[i][7:9] = lissajous(ti, trajectory_params_r24, 1)
#             elseif param_type == 25
#                 Xref[i][1:3] = lissajous(ti, trajectory_params_r25)
#                 Xref[i][7:9] = lissajous(ti, trajectory_params_r25, 1)
#             elseif param_type == 26
#                 Xref[i][1:3] = lissajous(ti, trajectory_params_r26)
#                 Xref[i][7:9] = lissajous(ti, trajectory_params_r26, 1)
#             elseif param_type == 27
#                 Xref[i][1:3] = lissajous(ti, trajectory_params_r27)
#                 Xref[i][7:9] = lissajous(ti, trajectory_params_r27, 1)
#             elseif param_type == 28
#                 Xref[i][1:3] = lissajous(ti, trajectory_params_r28)
#                 Xref[i][7:9] = lissajous(ti, trajectory_params_r28, 1)
#             elseif param_type == 29
#                 Xref[i][1:3] = lissajous(ti, trajectory_params_r29)
#                 Xref[i][7:9] = lissajous(ti, trajectory_params_r29, 1)
#             elseif param_type == 30
#                 Xref[i][1:3] = lissajous(ti, trajectory_params_r30)
#                 Xref[i][7:9] = lissajous(ti, trajectory_params_r30, 1)
#             end

#         end

#         # Control Input Trajectory
#         Uref = [(g*m/4)*ones(4) for i = 1:(N-1)]
        
#         return Xref, Uref
#     end
    
# end





function get_desired_trajectory_NMVS(t0, traj_type, N, dt, param_type, ω_val)
    
    
    if (traj_type == 1)
        Xref = [zeros(12) for i=1:N]
        for i = 1:(N)
            ti = t0 + (i-1)*dt
            # Desired Position
            if param_type == 1
                # First robot reference trajectory
                trajectory_params_1r = ComponentArray(
                    A = [2.5,2.5, 0.0],    # [5,5, 2.0]
                    ω = [ω_val, ω_val,0.], #ω = [0.5,0.5,0.],
                    ψ = [-π/2, 0, 0],
                    off = [3.0,3.0,3.0] # off
                    )
                Xref[i][1:3] = lissajous(ti, trajectory_params_1r)
                Xref[i][7:9] = lissajous(ti, trajectory_params_1r, 1)
            elseif param_type == 2
                # Second robot reference trajectory
                trajectory_params_2r = ComponentArray(
                        A = [2.5,2.5, 0.0],    # [5,5, 2.0]
                        ω = [ω_val,ω_val,0.], #[1.5,1.5,0.]
                        ψ = [π/2, 0, 0],
                        off = [-3.0,3.,3.0] # off
                    )
                Xref[i][1:3] = lissajous(ti, trajectory_params_2r)
                Xref[i][7:9] = lissajous(ti, trajectory_params_2r, 1)
            elseif param_type == 3
                # Third robot reference trajectory
                trajectory_params_3r = ComponentArray(
                    A = [2.5,2.5, 0.0],     # [5,5, 2.0]
                    ω = [ω_val,ω_val,0.], #[0.8,0.8,0.],
                    ψ = [π/2, 0, 0],
                    off = [-3.0,-3.0,3.0] # off
                )
                Xref[i][1:3] = lissajous(ti, trajectory_params_3r)
                Xref[i][7:9] = lissajous(ti, trajectory_params_3r, 1)
            elseif param_type == 4
                # Fourth robot reference trajectory
                trajectory_params_4r = ComponentArray(
                    A = [2.5,2.5, 0.0],     # [5,5, 2.0] [2.7,2.7, 0.7]
                    ω = [ω_val,ω_val,0.], #[1,1,0.], #
                    ψ = [-π/2, 0, 0],
                    off = [3.0,-3.0,3.0] # off
                )
                Xref[i][1:3] = lissajous(ti, trajectory_params_4r)
                Xref[i][7:9] = lissajous(ti, trajectory_params_4r, 1)
            end

        end

        # Control Input Trajectory
        Uref = [(g*m/4)*ones(4) for i = 1:(N-1)]
        
        return Xref, Uref
    end
    
end


# For 50 Quads 
function get_desired_trajectory(t0, traj_type, N, dt, param_type)
    
    
    if (traj_type == 1)
        Xref = [zeros(12) for i=1:N]
        for i = 1:(N)
            ti = t0 + (i-1)*dt
            # Desired Position
            if param_type == 1
                Xref[i][1:3] = lissajous(ti, trajectory_params_0)
                Xref[i][7:9] = lissajous(ti, trajectory_params_0, 1)
            elseif param_type == 2
                Xref[i][1:3] = lissajous(ti, trajectory_params_1)
                Xref[i][7:9] = lissajous(ti, trajectory_params_1, 1)
            elseif param_type == 3
                Xref[i][1:3] = lissajous(ti, trajectory_params_2)
                Xref[i][7:9] = lissajous(ti, trajectory_params_2, 1)
            elseif param_type == 4
                Xref[i][1:3] = lissajous(ti, trajectory_params_4)
                Xref[i][7:9] = lissajous(ti, trajectory_params_4, 1)
            elseif param_type == 5
                Xref[i][1:3] = lissajous(ti, trajectory_params_5)
                Xref[i][7:9] = lissajous(ti, trajectory_params_5, 1)
            elseif param_type == 6
                Xref[i][1:3] = lissajous(ti, trajectory_params_6)
                Xref[i][7:9] = lissajous(ti, trajectory_params_6, 1)
            elseif param_type == 7
                Xref[i][1:3] = lissajous(ti, trajectory_params_7)
                Xref[i][7:9] = lissajous(ti, trajectory_params_7, 1)
            elseif param_type == 8
                Xref[i][1:3] = lissajous(ti, trajectory_params_8)
                Xref[i][7:9] = lissajous(ti, trajectory_params_8, 1)
            elseif param_type == 9
                Xref[i][1:3] = lissajous(ti, trajectory_params_9)
                Xref[i][7:9] = lissajous(ti, trajectory_params_9, 1)
            elseif param_type == 10
                Xref[i][1:3] = lissajous(ti, trajectory_params_10)
                Xref[i][7:9] = lissajous(ti, trajectory_params_10, 1)
            elseif param_type == 11
                Xref[i][1:3] = lissajous(ti, trajectory_params_11)
                Xref[i][7:9] = lissajous(ti, trajectory_params_11, 1)
            elseif param_type == 12
                Xref[i][1:3] = lissajous(ti, trajectory_params_12)
                Xref[i][7:9] = lissajous(ti, trajectory_params_12, 1)
            elseif param_type == 13
                Xref[i][1:3] = lissajous(ti, trajectory_params_13)
                Xref[i][7:9] = lissajous(ti, trajectory_params_13, 1)
            elseif param_type == 14
                Xref[i][1:3] = lissajous(ti, trajectory_params_14)
                Xref[i][7:9] = lissajous(ti, trajectory_params_14, 1)
            elseif param_type == 15
                Xref[i][1:3] = lissajous(ti, trajectory_params_15)
                Xref[i][7:9] = lissajous(ti, trajectory_params_15, 1)
            elseif param_type == 16
                Xref[i][1:3] = lissajous(ti, trajectory_params_16)
                Xref[i][7:9] = lissajous(ti, trajectory_params_16, 1)
            elseif param_type == 17
                Xref[i][1:3] = lissajous(ti, trajectory_params_17)
                Xref[i][7:9] = lissajous(ti, trajectory_params_17, 1)
            elseif param_type == 18
                Xref[i][1:3] = lissajous(ti, trajectory_params_18)
                Xref[i][7:9] = lissajous(ti, trajectory_params_18, 1)
            elseif param_type == 19
                Xref[i][1:3] = lissajous(ti, trajectory_params_19)
                Xref[i][7:9] = lissajous(ti, trajectory_params_19, 1)
            elseif param_type == 20
                Xref[i][1:3] = lissajous(ti, trajectory_params_20)
                Xref[i][7:9] = lissajous(ti, trajectory_params_20, 1)
            elseif param_type == 21
                Xref[i][1:3] = lissajous(ti, trajectory_params_21)
                Xref[i][7:9] = lissajous(ti, trajectory_params_21, 1)
            elseif param_type == 22
                Xref[i][1:3] = lissajous(ti, trajectory_params_22)
                Xref[i][7:9] = lissajous(ti, trajectory_params_22, 1)
            elseif param_type == 23
                Xref[i][1:3] = lissajous(ti, trajectory_params_23)
                Xref[i][7:9] = lissajous(ti, trajectory_params_23, 1)
            elseif param_type == 24
                Xref[i][1:3] = lissajous(ti, trajectory_params_24)
                Xref[i][7:9] = lissajous(ti, trajectory_params_24, 1)
            elseif param_type == 25
                Xref[i][1:3] = lissajous(ti, trajectory_params_25)
                Xref[i][7:9] = lissajous(ti, trajectory_params_25, 1)
            elseif param_type == 26
                Xref[i][1:3] = lissajous(ti, trajectory_params_26)
                Xref[i][7:9] = lissajous(ti, trajectory_params_26, 1)
            elseif param_type == 27
                Xref[i][1:3] = lissajous(ti, trajectory_params_27)
                Xref[i][7:9] = lissajous(ti, trajectory_params_27, 1)
            elseif param_type == 28
                Xref[i][1:3] = lissajous(ti, trajectory_params_28)
                Xref[i][7:9] = lissajous(ti, trajectory_params_28, 1)
            elseif param_type == 29
                Xref[i][1:3] = lissajous(ti, trajectory_params_29)
                Xref[i][7:9] = lissajous(ti, trajectory_params_29, 1)
            elseif param_type == 30
                Xref[i][1:3] = lissajous(ti, trajectory_params_30)
                Xref[i][7:9] = lissajous(ti, trajectory_params_30, 1)
            elseif param_type == 31
                Xref[i][1:3] = lissajous(ti, trajectory_params_31)
                Xref[i][7:9] = lissajous(ti, trajectory_params_31, 1)
            elseif param_type == 32
                Xref[i][1:3] = lissajous(ti, trajectory_params_32)
                Xref[i][7:9] = lissajous(ti, trajectory_params_32, 1)
            elseif param_type == 33
                Xref[i][1:3] = lissajous(ti, trajectory_params_33)
                Xref[i][7:9] = lissajous(ti, trajectory_params_33, 1)
            elseif param_type == 34
                Xref[i][1:3] = lissajous(ti, trajectory_params_34)
                Xref[i][7:9] = lissajous(ti, trajectory_params_34, 1)
            elseif param_type == 35
                Xref[i][1:3] = lissajous(ti, trajectory_params_35)
                Xref[i][7:9] = lissajous(ti, trajectory_params_35, 1)
            elseif param_type == 36
                Xref[i][1:3] = lissajous(ti, trajectory_params_36)
                Xref[i][7:9] = lissajous(ti, trajectory_params_36, 1)
            elseif param_type == 37
                Xref[i][1:3] = lissajous(ti, trajectory_params_37)
                Xref[i][7:9] = lissajous(ti, trajectory_params_37, 1)
            elseif param_type == 38
                Xref[i][1:3] = lissajous(ti, trajectory_params_38)
                Xref[i][7:9] = lissajous(ti, trajectory_params_38, 1)
            elseif param_type == 39
                Xref[i][1:3] = lissajous(ti, trajectory_params_39)
                Xref[i][7:9] = lissajous(ti, trajectory_params_39, 1)
            elseif param_type == 40
                Xref[i][1:3] = lissajous(ti, trajectory_params_40)
                Xref[i][7:9] = lissajous(ti, trajectory_params_40, 1)
            elseif param_type == 41
                Xref[i][1:3] = lissajous(ti, trajectory_params_41)
                Xref[i][7:9] = lissajous(ti, trajectory_params_41, 1)
            elseif param_type == 42
                Xref[i][1:3] = lissajous(ti, trajectory_params_42)
                Xref[i][7:9] = lissajous(ti, trajectory_params_42, 1)
            elseif param_type == 43
                Xref[i][1:3] = lissajous(ti, trajectory_params_43)
                Xref[i][7:9] = lissajous(ti, trajectory_params_43, 1)
            elseif param_type == 44
                Xref[i][1:3] = lissajous(ti, trajectory_params_44)
                Xref[i][7:9] = lissajous(ti, trajectory_params_44, 1)
            elseif param_type == 45
                Xref[i][1:3] = lissajous(ti, trajectory_params_45)
                Xref[i][7:9] = lissajous(ti, trajectory_params_45, 1)
            elseif param_type == 46
                Xref[i][1:3] = lissajous(ti, trajectory_params_46)
                Xref[i][7:9] = lissajous(ti, trajectory_params_46, 1)
            elseif param_type == 47
                Xref[i][1:3] = lissajous(ti, trajectory_params_47)
                Xref[i][7:9] = lissajous(ti, trajectory_params_47, 1)
            elseif param_type == 48
                Xref[i][1:3] = lissajous(ti, trajectory_params_48)
                Xref[i][7:9] = lissajous(ti, trajectory_params_48, 1)
            elseif param_type == 49
                Xref[i][1:3] = lissajous(ti, trajectory_params_49)
                Xref[i][7:9] = lissajous(ti, trajectory_params_49, 1)
            elseif param_type == 50
                Xref[i][1:3] = lissajous(ti, trajectory_params_50)
                Xref[i][7:9] = lissajous(ti, trajectory_params_50, 1)
            end

        end

        # Control Input Trajectory
        Uref = [(g*m/4)*ones(4) for i = 1:(N-1)]
        
        return Xref, Uref
    end
    
end



# =============== Point Trajectory =================
function get_desired_trajectory_point(t0, N, dt, q_n)
    Xref = [zeros(12) for i=1:N]
    for i = 1:N
        ti = t0 + (i-1)*dt
        Xref[i][1:3] = [0.0; 0.0; 0.11]
    end
    # Control Input Trajectory
    Uref = [(g*m/4)*ones(4) for i = 1:(N-1)]

    return Xref, Uref
end
# ==================================================


# =============== Point Trajectory =================
function get_desired_trajectory_point_mobile(t0, N, dt, q_n, ren_point)
    Xref = [zeros(12) for i=1:N]
    for i = 1:N
        ti = t0 + (i-1)*dt
        Xref[i][1:3] = ren_point

        # if q_n == 1
        #     Xref[i][1:3] = [3.0; 3.0; 0.11]
        # elseif q_n == 2
        #     Xref[i][1:3] = [-3.0; 3.0; 0.11]
        # elseif q_n == 3
        #         Xref[i][1:3] = [-3.0; -3.0; 0.11]
        # elseif q_n == 4
        #         Xref[i][1:3] = [3.0; -3.0; 0.11]
        # end
    end
    # Control Input Trajectory
    Uref = [(g*m/4)*ones(4) for i = 1:(N-1)]

    return Xref, Uref
end
# ==================================================






### ------------------- Reference trajectory states for the DI Experimental code [Start] ------------------
# For 3 Quads 
# function get_desired_trajectory(t0, traj_type, N, dt, param_type)



function DI_3D_get_desired_trajectory(t0, traj_type, N, dt, param_type)
    
    if (traj_type == 1)
        DIXref = [zeros(6) for i=1:N]
        for i = 1:(N)
            ti = t0 + (i-1)*dt
            # Desired Position
            if param_type == 1
                DIXref[i][1:3] = lissajous(ti, trajectory_params_0)
                DIXref[i][4:6] = lissajous(ti, trajectory_params_0, 1)
            elseif param_type == 2
                DIXref[i][1:3] = lissajous(ti, trajectory_params_1)
                DIXref[i][4:6] = lissajous(ti, trajectory_params_1, 1)
            elseif param_type == 3
                DIXref[i][1:3] = lissajous(ti, trajectory_params_2)
                DIXref[i][4:6] = lissajous(ti, trajectory_params_2, 1)
            elseif param_type == 4
                DIXref[i][1:3] = lissajous(ti, trajectory_params_4)
                DIXref[i][4:6] = lissajous(ti, trajectory_params_4, 1)
            elseif param_type == 5
                DIXref[i][1:3] = lissajous(ti, trajectory_params_5)
                DIXref[i][4:6] = lissajous(ti, trajectory_params_5, 1)
            end

        end

        # Control Input Trajectory
        DIUref = [[0; 0; 0.0] for i = 1:(N-1)]        
        return DIXref, DIUref
    end 
end

# This function gives a fixed setpoint as the target reference state
function DI_3D_get_desired_nonlanding_point(t0, N, dt, q_n)
    DIXref = [zeros(6) for i=1:N]
    for i = 1:N
        ti = t0 + (i-1)*dt
        DIXref[i][1:3] = [0.; 0; 1.5] # This could could be the position of the mobile charging robot or the state of the 
    end
    # Control Input Trajectory
    DIUref = [[0; 0; 0.0] for i = 1:(N-1)]
    return DIXref, DIUref 
end

function DI_3D_get_desired_point(t0, N, dt, q_n, ren_point)
    DIXref = [zeros(6) for i=1:N]
    for i = 1:N
        ti = t0 + (i-1)*dt
        DIXref[i][1:3] = ren_point # This could could be the position of the mobile charging robot or the state of the 
    end
    # Control Input Trajectory
    DIUref = [[0; 0; 0.0] for i = 1:(N-1)]
    return DIXref, DIUref 
end

function DI_3D_get_desired_point_mid_stage(t0, N, dt, q_n, ren_point_1, ren_point_2)
    DIXref = [zeros(6) for i = 1:N]
    for i = 1:N
        if i <= (N / 2)
            DIXref[i][1:3] = ren_point_1
        else
            DIXref[i][1:3] = ren_point_2
        end
    end
    # Control Input Trajectory
    DIUref = [[0; 0; 0.0] for i = 1:(N-1)]
    return DIXref, DIUref 
end

function DI_3D_get_desried_nominal_setpoint(t0, traj_type, N, dt, param_type)
    
    if (traj_type == 1)
        DIXref = [zeros(6) for i=1:N]
        for i = 1:(N)
            ti = t0 + (i-1)*dt
            # Desired Position
            if param_type == 1
                DIXref[i][1:3] = [0; 0; 3.0]
                DIXref[i][4:6] = zeros(3)
            elseif param_type == 2
                DIXref[i][1:3] = lissajous(ti, trajectory_params_2)
                DIXref[i][4:6] = lissajous(ti, trajectory_params_2, 1)
            elseif param_type == 3
                DIXref[i][1:3] = lissajous(ti, trajectory_params_3)
                DIXref[i][4:6] = lissajous(ti, trajectory_params_3, 1)
            end

        end

        # Control Input Trajectory
        DIUref = [[0; 0; 0.0] for i = 1:(N-1)]        
        return DIXref, DIUref
    end 

end


### ------------------- Reference trajectory states for the DI Experimental code [End] ------------------










# # =============== Point Trajectory (Different charging stations) =================
# function get_desired_trajectory_point(t0, N, dt, q_n)
#     Xref = [zeros(12) for i=1:N]
#     for i = 1:N
#         ti = t0 + (i-1)*dt
#         if q_n == 1
#             Xref[i][1:3] = [4.0; 4.0; 0.11]
#         elseif q_n == 2
#             Xref[i][1:3] = [-4.0; -4.0; 0.11]
#         elseif q_n == 3
#             Xref[i][1:3] = [-4.0; 4.0; 0.11]
#         elseif q_n == 4
#             Xref[i][1:3] = [4.0; -4.0; 0.11]
#         end
#     end
#     # Control Input Trajectory
#     Uref = [(g*m/4)*ones(4) for i = 1:(N-1)]

#     return Xref, Uref
# end
# # ==================================================


# function figureEight(t)

#     N = 1.0
#     xd = N * sin(t/10)
#     yd = N * sin(t/20) + 1.0
#     zd = 0.
    
#     # vecloity desired
#     xd_dot = N * cos(t/10)/10
#     yd_dot = N * cos(t/20)/20
#     zd_dot = 0.
    
#     # Acceleration Desired
#     xd_ddot = -N * sin(t/10)/100
#     yd_ddot = -N * sin(t/20)/400
#     zd_ddot = 0.
    
#     ϕd = atan(yd_dot, xd_dot) 
    
#     x_des = [xd; xd_dot; xd_ddot]
#     y_des = [yd; yd_dot; yd_ddot]
#     z_des = [zd; zd_dot; zd_ddot]
    
#     return x_des, y_des, z_des, ϕd
    
# end

function figureEight(t, k=6.0)  # k > 1 speeds up the trajectory

    N = 1.3
    xd = N * sin(k * t / 10) - 0.3
    yd = N * sin(k * t / 20) + 0.3
    zd = 0.
    
    # Velocity Desired
    xd_dot = k * N * cos(k * t / 10) / 10
    yd_dot = k * N * cos(k * t / 20) / 20
    zd_dot = 0.
    
    # Acceleration Desired
    xd_ddot = -k^2 * N * sin(k * t / 10) / 100
    yd_ddot = -k^2 * N * sin(k * t / 20) / 400
    zd_ddot = 0.
    
    ϕd = atan(yd_dot, xd_dot) 
    
    x_des = [xd; xd_dot; xd_ddot]
    y_des = [yd; yd_dot; yd_ddot]
    z_des = [zd; zd_dot; zd_ddot]
    
    return x_des, y_des, z_des, ϕd
    
end

function get_desired_trajectory_eight(t0, N, dt)

    # This is only for the plotting purposes thus only send the pos
    Xref = [zeros(3) for i=1:N]
    for i = 1:(N)
        ti = t0 + (i-1)*dt
        # Desired Position
        x_des, y_des, z_des, ϕd = figureEight(ti)
        Xref[i] = [x_des[1]; y_des[1]; z_des[1]]
    end

    # Actucally I can put vd and ωd here and send them as Uref

    return Xref
    
end

end