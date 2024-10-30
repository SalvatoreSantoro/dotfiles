#!/bin/bash

# Get the current active workspace
current_workspace=$(hyprctl monitors | grep "active workspace" | awk '{print $3}')

# Define the maximum number of workspaces (adjust as needed)
max_workspaces=2

# Increment workspace number (wrap around to 1 if exceeding max)
next_workspace=$(( (current_workspace % max_workspaces) + 1 ))

# Switch to the next workspace
hyprctl dispatch workspace $next_workspace
