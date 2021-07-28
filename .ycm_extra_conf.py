import os
import os.path
import fnmatch
import logging
import ycm_core
import re

C_BASE_FLAGS = [
    '-Wall',
    '-Wextra',
    '-Werror',
    '-Wno-long-long',
    '-Wno-variadic-macros',
    '-fexceptions',
    '-ferror-limit=10000',
    '-DNDEBUG',
    '-std=c11',
    '-I/usr/lib/',
    '-I/usr/include/'
]

CPP_BASE_FLAGS = [
    '-Wall',
    '-Wextra',
    '-Wno-long-long',
    '-Wno-variadic-macros',
    '-fexceptions',
    '-ferror-limit=10000',
    '-DNDEBUG',
    '-std=c++1z',
    '-xc++',
    '-I/usr/lib/',
    '-I/usr/include/'
]

C_SOURCE_EXTENSIONS = [
    '.c'
]

CPP_SOURCE_EXTENSIONS = [
    '.cpp',
    '.cxx',
    '.cc',
    '.m',
    '.mm'
]

SOURCE_DIRECTORIES = [
    'src',
    'lib'
]

HEADER_EXTENSIONS = [
    '.h',
    '.hxx',
    '.hpp',
    '.hh'
]

HEADER_DIRECTORIES = [
    'include'
]

BUILD_DIRECTORY = 'build'


def IsSourceFile(filename):
    extension = os.path.splitext(filename)[1]
    return extension in C_SOURCE_EXTENSIONS + CPP_SOURCE_EXTENSIONS


def IsHeaderFile(filename):
    extension = os.path.splitext(filename)[1]
    return extension in HEADER_EXTENSIONS


def GetCompilationInfoForFile(database, filename):
    if IsHeaderFile(filename):
        root = os.path.dirname(os.path.abspath(filename))
        source_file = FindSourceToHeader(root, filename)
        if source_file:
            return database.GetCompilationInfoForFile(source_file)
        return None
    return database.GetCompilationInfoForFile(filename)


def FindNearest(path, target):
    candidate = os.path.join(path, target)
    if(os.path.isfile(candidate) or os.path.isdir(candidate)):
        logging.info("Found nearest " + target + " at " + candidate)
        return candidate

    parent = os.path.dirname(os.path.abspath(path))
    if(parent == path):
        raise RuntimeError("Could not find " + target)

    return FindNearest(parent, target)


def FindCompilationDatabase(path, src_filename, level=0):
    filename = "compile_commands.json"
    for root, dirs, files in os.walk(path):
        for f in files:
            if f.endswith(filename):
                candidate = os.path.join(root, filename)
                logging.info("Searching for compilation db in " + candidate)
                with open(candidate) as database:
                    for line in database:
                        if src_filename in line:
                            logging.info("Found nearest " + "compile_commands.json at " + candidate)
                            return candidate
    parent = os.path.dirname(os.path.abspath(path))
    if level > 8 or parent == path:
        raise RuntimeError("Could not find compilation database for file " + src_filename)
    return FindCompilationDatabase(parent, src_filename, level+1)

def FindSourceToHeader(path, header_filename, level=0):
    """
    Compilation databases only contain information about cpp files, not their headers. We do our
    best to find a matching cpp file that includes this header file and get flags from that.
    """
    basename = os.path.basename(header_filename)
    regex = r'#include\s*(<|")(?P<filename>.*'+re.escape(basename)+r')(>|")'
    print(regex)

    for root, dirs, files in os.walk(path):
        for f in files:
            extension = os.path.splitext(f)[1]
            if extension in C_SOURCE_EXTENSIONS or extension in CPP_SOURCE_EXTENSIONS or extension in HEADER_EXTENSIONS:
                filepath = os.path.abspath(os.path.join(root, f))
                if filepath != header_filename:
                    with open(filepath) as content:
                        for line in content:
                            if re.search(regex, line):
                                m = re.match(regex, line)
                                if header_filename.endswith(m.group('filename')):
                                    logging.info("Found match for header {}: {}"
                                                 .format(header_filename, filepath))
                                    return filepath

    parent = os.path.dirname(os.path.abspath(path))
    if level > 5:
        return None
    return FindSourceToHeader(parent, header_filename, level+1)


def MakeRelativePathsInFlagsAbsolute(flags, working_directory):
    if not working_directory:
        return list(flags)
    new_flags = []
    make_next_absolute = False
    path_flags = ['-isystem', '-I', '-iquote', '--sysroot=']
    for flag in flags:
        new_flag = flag

        if make_next_absolute:
            make_next_absolute = False
            if not flag.startswith('/'):
                new_flag = os.path.join(working_directory, flag)

        for path_flag in path_flags:
            if flag == path_flag:
                make_next_absolute = True
                break

            if flag.startswith(path_flag):
                path = flag[len(path_flag):]
                new_flag = path_flag + os.path.join(working_directory, path)
                break

        if new_flag:
            new_flags.append(new_flag)
    return new_flags


def FlagsForClangComplete(root):
    try:
        clang_complete_path = FindNearest(root, '.clang_complete')
        clang_complete_flags = open(clang_complete_path, 'r').read().splitlines()
        return clang_complete_flags
    except:
        return None


def FlagsForInclude(root):
    try:
        include_path = FindNearest(root, 'include')
        flags = []
        for dirroot, dirnames, filenames in os.walk(include_path):
            for dir_path in dirnames:
                real_path = os.path.join(dirroot, dir_path)
                flags = flags + ["-I" + real_path]
        return flags
    except:
        return None


def FlagsForCompilationDatabase(root, filename):
    while IsHeaderFile(filename):
        # Traverse the include tree up until we find a cpp file that we can get completions for
        source_file = FindSourceToHeader(root, filename)
        logging.info("source_file:" + source_file)
        if source_file:
            filename = source_file
            logging.info("filename: " + filename)

    try:
        compilation_db_path = FindCompilationDatabase(root, filename)

        compilation_db_dir = os.path.dirname(compilation_db_path)
        logging.info("Set compilation database directory to " + compilation_db_dir)
        compilation_db = ycm_core.CompilationDatabase(compilation_db_dir)
        if not compilation_db:
            logging.info("Compilation database file found but unable to load")
            return None
        compilation_info = GetCompilationInfoForFile(compilation_db, filename)
        if not compilation_info:
            logging.info("No compilation info for " + filename + " in compilation database")
            return None
        return MakeRelativePathsInFlagsAbsolute(
            compilation_info.compiler_flags_,
            compilation_info.compiler_working_dir_)
    except:
        logging.info("Did not find info from compilation database")
        return None


def Settings(**kwargs):
    filename = kwargs[ 'filename' ]
    logging.info("Addinf glags for file %s", filename)
    final_flags = []
    root = os.path.realpath(filename)
    compilation_db_flags = FlagsForCompilationDatabase(root, filename)
    if compilation_db_flags:
        final_flags = compilation_db_flags
    else:
        if IsSourceFile(filename):
            extension = os.path.splitext(filename)[1]
            if extension in C_SOURCE_EXTENSIONS:
                final_flags = C_BASE_FLAGS
            else:
                final_flags = CPP_BASE_FLAGS

        clang_flags = FlagsForClangComplete(root)
        if clang_flags:
            final_flags = final_flags + clang_flags
        include_flags = FlagsForInclude(root)
        if include_flags:
            final_flags = final_flags + include_flags
    return {
        'flags': final_flags,
        'do_cache': True
    }
