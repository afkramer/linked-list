# linked-list
My solution to the The Odin Project linked list project

## What did I learn
This project was a great way to remind myself that variables in Ruby point to the objects assigned to them. It was also a great opportunity to try to refactor a little bit. When implementing the methods, I just went for a naive/obvious approach at first. Then when all the methods were done I could compare the methods and identify where there are similarities/differences. This formed the basis for then trying to create abstractions instead of duplicating code. I was really happy that I was able to set up the #traverse method to work with blocks passed into it.

## Room for improvement
Even if I was able to avoid a lot of duplication in the code, there still could be some room for improvement with the #traverse and #step methods. It feels like I am having #traverse handle too many different cases, which might make it unclear to others reading the code what it's actually for. In the end I think that I understood the main gist, which was to work with creating our own data structures, so I will move on to the next topic!