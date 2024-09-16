add_executable(
    foo
    misc/foo.cpp
)
target_link_libraries(
    foo
    GTest::gtest_main
)

add_executable(
    abc
    misc/abc.cpp
)


include(GoogleTest)
gtest_discover_tests(foo)
