package main

import rl "vendor:raylib"


main :: proc() {
    rl.InitWindow(800, 450, "raylib with Odin - basic window render")

    for !rl.WindowShouldClose() {
        rl.BeginDrawing()
            rl.ClearBackground(rl.LIGHTGRAY)
            rl.DrawText("This is my first window in raylib", 190, 200, 20, rl.RAYWHITE)
        rl.EndDrawing()
    }

    rl.CloseWindow()
}