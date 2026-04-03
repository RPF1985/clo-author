---
paths:
  - "**/*.R"
  - "**/*.r"
  - "scripts/**"
---

# R Function Verification Rule

## Requirement

Before using any R function the agent has not already verified in the current session, it must first retrieve and review the function's help documentation and confirm correct usage before writing or executing code that calls it.

## Protocol

1. **Check if function is pre-verified.** The following base R functions are always pre-verified and do not require documentation lookup:
   - Arithmetic and logic: `+`, `-`, `*`, `/`, `%%`, `%/%`, `!`, `&`, `|`, `==`, `!=`, `<`, `>`, `<=`, `>=`
   - Basic: `c`, `list`, `data.frame`, `matrix`, `array`, `vector`, `factor`
   - Math: `sum`, `mean`, `median`, `sd`, `var`, `min`, `max`, `abs`, `sqrt`, `log`, `exp`, `round`, `ceiling`, `floor`
   - String: `paste`, `paste0`, `sprintf`, `nchar`, `substr`, `gsub`, `sub`, `grep`, `grepl`
   - Apply family: `lapply`, `sapply`, `vapply`, `mapply`, `tapply`, `apply`
   - Data manipulation: `merge`, `rbind`, `cbind`, `subset`, `which`, `ifelse`, `switch`
   - I/O: `read.csv`, `write.csv`, `readRDS`, `saveRDS`, `readLines`, `writeLines`, `cat`, `print`
   - Control: `if`, `else`, `for`, `while`, `repeat`, `next`, `break`, `return`, `function`
   - Environment: `library`, `require`, `install.packages`, `set.seed`, `options`, `getwd`, `setwd`
   - Type checking: `is.na`, `is.null`, `is.numeric`, `is.character`, `is.logical`, `length`, `nrow`, `ncol`, `dim`, `names`, `colnames`, `rownames`, `class`, `typeof`, `str`, `head`, `tail`, `summary`

2. **For any non-pre-verified function**, before first use in a session:
   ```r
   ?function_name
   # or
   help(function_name)
   ```
   Review: argument names, default values, return type, and any gotchas noted in the documentation.

3. **Confirm correct usage** by checking:
   - Argument names match the documentation (not positional guessing)
   - Default values are appropriate for the use case
   - Return type is what the downstream code expects

4. **Mark as verified** for the remainder of the session. No need to re-check the same function twice.

## Why This Exists

LLMs occasionally hallucinate function arguments, use deprecated syntax, or confuse similarly-named functions across packages. A quick documentation check catches these errors before they propagate into analysis code.

## Scope

This rule applies to the **coder** agent when writing R scripts. It does not apply to critics (who don't write code) or to other languages.
