package main

import rl "vendor:raylib"


main :: proc() {
    SCREEN_WIDTH : i32 : 1280
    SCREEN_HEIGHT : i32 : 720
    MAX_PILLARS : int : 20

    defer rl.CloseWindow()
    rl.InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "first person camera in 3D")


    camera:= rl.Camera3D {
        position = {4, 4, 4},
        target = {0, 0, 0},
        up = {0, 1, 0},
        fovy = 75.0,
        projection = .PERSPECTIVE,
    }

    camera_mode:= rl.CameraMode.FREE

    heights: [MAX_PILLARS]f32 
    positions: [MAX_PILLARS]rl.Vector3 
    colors: [MAX_PILLARS]rl.Color

    for i := 0 ; i < MAX_PILLARS; i += 1 {
        heights[i] = cast(f32)rl.GetRandomValue(1, 12)
        positions[i] = rl.Vector3{cast(f32)rl.GetRandomValue(-15, 15), heights[i] / 2.0, cast(f32)rl.GetRandomValue(-15, 15)}
        colors[i] = rl.Color{cast(u8)rl.GetRandomValue(20, 255), cast(u8)rl.GetRandomValue(10, 55), 30, 255}
    }

    rl.DisableCursor()
    rl.SetTargetFPS(60)


    for !rl.WindowShouldClose() {
        rl.UpdateCamera(&camera, camera_mode)
        rl.BeginDrawing()
            rl.ClearBackground(rl.RAYWHITE)
            rl.BeginMode3D(camera)
                // Ground
                rl.DrawPlane({0, 0, 0}, {32, 32}, rl.LIGHTGRAY)
                rl.DrawCube({-16, 2.5, 0}, 1, 5, 32, rl.BLUE)
                
                for i:= 0; i < MAX_PILLARS; i += 1 {
                    rl.DrawCube(positions[i], 2, heights[i], 2, colors[i])
                    rl.DrawCubeWires(positions[i], 2, heights[i], 2, rl.MAROON)
                }
            rl.EndMode3D() 
        rl.EndDrawing()

        

    }



}
