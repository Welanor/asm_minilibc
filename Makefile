##
## Makefile for Makefile in /home/Epitech
##
## Made by moriss_h
## Login   <moriss_h@epitech.net>
##
## Started on  Sun Jun  9 03:35:24 2013 Hugues
## Last update Thu Mar 27 00:31:52 2014 
##

SRC		=	strpbrk.S \
			strcspn.S \
			rindex.S \
			strlen.S \
			memset.S \
			strchr.S \
			memcpy.S \
			memmove.S \
			strcasecmp.S \
			strcmp.S \
			strcat.S \
			strdup.S \
			strncat.S \
			strncmp.S \
			strcpy.S \
			strncpy.S

CC		=	nasm
LD		=	gcc

RM		=	rm -f

NAME		=	libasm.so

OBJDIR		=	obj/
SRCDIR		=	src/

CFLAGS		+=	-f elf64

LDFLAGS		+=	-shared

OBJ		=	$(patsubst %.S,${OBJDIR}%.o, $(SRC))

dummy		:=	$(shell test -d $(OBJDIR) || mkdir -p $(OBJDIR))
dummy		:=	$(shell test -d $(SRCDIR) || mkdir -p $(SRCDIR))

$(OBJDIR)%.o:		$(patsubst %.S,${SRCDIR}%.S, %.S)
			@if [ ! -d $(dir $@) ]; then mkdir -p $(dir $@); fi
			@echo -e "Compiling $< { $(CFLAGS) }" | sed 's/^-e //' \
			| sed 's/[-a-zA-Z]\+/\x1B[31m&\x1B[0m/g' \
			| sed 's/[A-Z]\+/\x1B[32m&\x1B[0m/g' \
			| sed 's/[{}]/\x1B[34m&\x1B[0m/g' \
			| sed 's/[─┬─├─└│]/\x1B[35m&\x1B[0m/g'
			@$(CC) $(CFLAGS) $< -o $@

$(NAME):	$(OBJ)
		@echo -e "Linking $@ { $(LDFLAGS) }" | sed 's/^-e //' \
		| sed 's/[-a-zA-Z]\+/\x1B[34m&\x1B[0m/g'
		@$(LD) $(LDFLAGS) -o $(NAME) $(OBJ)

all:	$(NAME)

clean:
	@echo -e "Removing object !" | sed 's/^-e //' \
	| sed 's/[-a-zA-Z]\+/\x1B[35m&\x1B[0m/g'
	@$(RM) $(OBJ)

fclean:	clean
	@echo -e "Removing ${NAME} !" | sed 's/^-e //' \
	| sed 's/[-a-zA-Z]\+/\x1B[36m&\x1B[0m/g'
	@$(RM) $(NAME)
	@$(RM) $(SYMLINK)

re:	fclean all

help:
	@echo -e "\033[37mTarget available: all, ${NAME}, clean, fclean\033[00m" | sed 's/^-e //'

.PHONY:	all clean fclean re help
