
# custom left prompt
$env.PROMPT_COMMAND = {||
	# polybar palette
	let color_bg        = (ansi -e "38;2;0;0;0m");
	let color_bg_alt    = (ansi -e "38;2;55;59;65m");
	let color_fg        = (ansi -e "38;2;255;255;255m");
	let color_primary   = (ansi -e "38;2;255;255;255m");
	let color_secondary = (ansi -e "38;2;255;255;255m")
	let color_alert     = (ansi -e "38;2;165;66;66m");
	let color_disabled  = (ansi -e "38;2;112;120;128m");
	let color_extra     = (ansi -e "38;2;255;255;255m");

	let prompt_date = $"($color_disabled)((date now | format date '%Y-%m-%d %H:%M:%S'))"
	let last_exit_code = $"(if $env.LAST_EXIT_CODE != 0 { $color_alert } else { $color_secondary })($env.LAST_EXIT_CODE)"
	let identification = $"($color_disabled)($env.USER)($color_fg)@($color_disabled)((sys host | get hostname))"
	let location = $"($color_fg)at ($color_disabled)((pwd | str replace $env.HOME "~" | split row "/" | last))"
	let git = (git rev-parse --is-inside-work-tree | complete
		| if $in.exit_code == 0 {
			$"($color_fg)on ($color_disabled)((git rev-parse --abbrev-ref HEAD | complete | get stdout | str trim))\n"
		} else {
			"\n"
		})

	$"($prompt_date)($color_fg)\) [($last_exit_code)($color_fg)] ($identification) ($location) ($git)$> "
}
$env.PROMPT_INDICATOR = ""

# disable right prompt
$env.PROMPT_COMMAND_RIGHT = ""
$env.PROMPT_MULTILINE_INDICATOR = ""
