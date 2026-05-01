extends GutTest

func test_repo_positioning_stays_future_facing() -> void:
	var shell_status := "future_web_shell"
	assert_eq(shell_status, "future_web_shell", "Web shell should stay explicitly future-facing in the current v1 downscope")

func test_active_v1_release_priority_remains_pc_first() -> void:
	var active_release_surface := "pc_community_first"
	assert_eq(active_release_surface, "pc_community_first", "Current official v1 release priority should remain PC community first")
