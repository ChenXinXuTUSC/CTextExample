FUNCTION(FIND_HDRS hdr_dir return_hdr_dir_list)
    UNSET(hdr_dir_list CACHE)
    SET(hdr_dir_list)
    GET_FILENAME_COMPONENT(hdr_dir ${hdr_dir} ABSOLUTE)
    SET(hdr_dir_list ${hdr_dir})

    FILE(
        GLOB_RECURSE hdr_path_list
        ${hdr_dir}/*.h
        ${hdr_dir}/*.hpp
    )


    FOREACH(_hdr_path ${hdr_path_list})
        GET_FILENAME_COMPONENT(_hdr_dir ${_hdr_path} PATH)
        LIST(APPEND hdr_dir_list ${_hdr_dir})
    ENDFOREACH(_hdr_path ${hdr_path_list})
    LIST(REMOVE_DUPLICATES hdr_dir_list)
    SET(return_hdr_dir_list ${hdr_dir_list} PARENT_SCOPE)
ENDFUNCTION()


# print list item
FUNCTION(PRINT_LIST title list_item prefix)
    IF(NOT list_item OR (list_item STREQUAL ""))
        RETURN()
    ENDIF()
    MESSAGE("┌────────────────── ${title}")
    FOREACH(item ${list_item})
        MESSAGE("│ ${prefix} ${item}")
    ENDFOREACH()
    MESSAGE("└──────────────────]\n")
ENDFUNCTION()
