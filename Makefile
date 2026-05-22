# ===================================================== #
#              cub3d Makefile                           #
# ===================================================== #

NAME        := cub3d
DEBUG_NAME  := cub3d_debug

# Tools
CC          := cc
CFLAGS      := -Wall -Wextra -Werror
RM          := rm -f
RMR         := rm -rf
MKDIR_P     := mkdir -p

# Colors and Formatting
GREEN       := \033[1;32m
YELLOW      := \033[1;33m
BLUE        := \033[1;34m
RED         := \033[1;31m
RESET       := \033[0m
UP          := \033[A
CUT         := \033[K
LINE        := "==========================================="

# Directories
SRC_DIR     := sources
OBJ_DIR     := objects
DBG_OBJ_DIR := obj_debug
INC_DIR     := include
LIBS_DIR    := libs

# Libraries Paths
LIBFT_DIR   := $(LIBS_DIR)/libft
MLX_DIR     := $(LIBS_DIR)/minilibx-linux
LIBFT_A     := $(LIBFT_DIR)/libft.a
MLX_A       := $(MLX_DIR)/libmlx.a

# Compiler & Linker Flags
CPPFLAGS    := -I$(INC_DIR) -I$(LIBFT_DIR) -I$(MLX_DIR)
LDFLAGS     := -L$(LIBFT_DIR) -L$(MLX_DIR)
LDLIBS      := -lft -lmlx -lXext -lX11 -lm -lz

# Source Files List
SRC_FILES   := main.c \
               parsing/parser.c parsing/parse_file.c parsing/parse_data.c \
               parsing/parse_data_utils.c parsing/parse_map.c \
               parsing/parse_map_utils_1.c parsing/parse_map_utils_2.c \
               parsing/parse_map_copy.c \
               game/events.c game/game_loop.c game/init_graphics.c \
               game/player_init.c game/render.c game/raycast.c \
               game/movement_1.c game/movement_2.c game/textures.c \
               game/textures_render.c game/minimap.c \
               init/init.c init/errors.c init/cleanup.c init/validation.c

# Progress Variables
TOTAL_FILES := $(words $(SRC_FILES))
CURR_FILE   := 0

# Object mapping
OBJS        := $(addprefix $(OBJ_DIR)/,$(SRC_FILES:.c=.o))
DEPS        := $(OBJS:.o=.d)

# =======================
# Main Targets
# =======================
.PHONY: all debug clean fclean re

all: $(NAME)

$(NAME): $(LIBFT_A) $(MLX_A) $(OBJS)
	@$(CC) $(OBJS) $(LDFLAGS) $(LDLIBS) -o $(NAME)
	@echo "\n$(GREEN)$(LINE)"
	@echo "      Successfully compiled $(NAME)"
	@echo "$(LINE)$(RESET)\n"

# Debug build
debug: CFLAGS += -g
debug: $(LIBFT_A) $(OBJS)
	@$(CC) $(OBJS) $(LDFLAGS) $(LDLIBS) -o $(DEBUG_NAME)
	@echo "\n$(GREEN)$(LINE)"
	@echo "      Successfully compiled $(DEBUG_NAME)"
	@echo "$(LINE)$(RESET)\n"

# Compiling Objects with Progress Bar
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@$(MKDIR_P) $(dir $@)
	@$(eval CURR_FILE=$(shell echo $$(($(CURR_FILE)+1))))
	@printf "$(YELLOW)[%-2d/%2d] $(BLUE)Compiling: $(RESET)%-30s" $(CURR_FILE) $(TOTAL_FILES) $<
	@$(CC) $(CFLAGS) $(CPPFLAGS) -MMD -MP -c $< -o $@
	@printf "\r$(CUT)"

-include $(DEPS)

# =======================
# Libraries Compilation
# =======================
$(LIBFT_A):
	@printf "$(YELLOW)>> Building libft...$(RESET)\r"
	@$(MAKE) -C $(LIBFT_DIR) --no-print-directory > /dev/null 2>&1
	@printf "$(GREEN)>> libft ready!$(RESET)$(CUT)\n"

$(MLX_A):
	@printf "$(YELLOW)>> Building minilibx...$(RESET)\r"
	@if [ ! -f "$(MLX_DIR)/Makefile.gen" ]; then \
		cd $(MLX_DIR) && ./configure > /dev/null 2>&1; \
	fi
	@$(MAKE) -C $(MLX_DIR) --no-print-directory > /dev/null 2>&1
	@printf "$(GREEN)>> minilibx ready!$(RESET)$(CUT)\n"

# =======================
# Cleaning
# =======================
clean:
	@$(RMR) $(OBJ_DIR)
	@if [ -d "$(LIBFT_DIR)" ]; then $(MAKE) -C $(LIBFT_DIR) clean --no-print-directory; fi
	@if [ -d "$(MLX_DIR)" ]; then $(MAKE) -C $(MLX_DIR) clean --no-print-directory; fi
	@echo "$(RED)Object files removed.$(RESET)"

fclean: clean
	@$(RM) $(NAME) $(DEBUG_NAME)
	@if [ -d "$(LIBFT_DIR)" ]; then $(MAKE) -C $(LIBFT_DIR) fclean --no-print-directory; fi
	@echo "$(RED)Binaries and libraries removed.$(RESET)"

re: fclean all