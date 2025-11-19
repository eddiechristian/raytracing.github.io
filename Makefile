# Makefile for Ray Tracing Weekend Series
# Replaces CMakeLists.txt

CXX = g++
CXXFLAGS = -std=c++11 -Isrc -O2 -Wall
WARNINGS = -Wnon-virtual-dtor -Wreorder -Wmaybe-uninitialized -Wunused-variable

# Directories
SRCDIR = src
EXTERNAL_DIR = $(SRCDIR)/external
INONEWEEKEND_DIR = $(SRCDIR)/InOneWeekend
THENEXTWEEK_DIR = $(SRCDIR)/TheNextWeek
THERESTOFYOURLIFE_DIR = $(SRCDIR)/TheRestOfYourLife

# External dependencies
EXTERNAL = $(EXTERNAL_DIR)/stb_image.h

# Source files for main programs
SOURCE_ONE_WEEKEND = $(INONEWEEKEND_DIR)/main.cc
SOURCE_NEXT_WEEK = $(THENEXTWEEK_DIR)/main.cc
SOURCE_REST_OF_YOUR_LIFE = $(THERESTOFYOURLIFE_DIR)/main.cc

# All executables
EXECUTABLES = inOneWeekend theNextWeek theRestOfYourLife \
              cos_cubed cos_density integrate_x_sq pi \
              estimate_halfway sphere_importance sphere_plot

.PHONY: all clean

all: $(EXECUTABLES)

# Main program targets
inOneWeekend: $(SOURCE_ONE_WEEKEND) $(EXTERNAL)
	$(CXX) $(CXXFLAGS) $(WARNINGS) -o $@ $(SOURCE_ONE_WEEKEND)

theNextWeek: $(SOURCE_NEXT_WEEK) $(EXTERNAL)
	$(CXX) $(CXXFLAGS) $(WARNINGS) -o $@ $(SOURCE_NEXT_WEEK)

theRestOfYourLife: $(SOURCE_REST_OF_YOUR_LIFE) $(EXTERNAL)
	$(CXX) $(CXXFLAGS) $(WARNINGS) -o $@ $(SOURCE_REST_OF_YOUR_LIFE)

# Utility programs
cos_cubed: $(THERESTOFYOURLIFE_DIR)/cos_cubed.cc
	$(CXX) $(CXXFLAGS) $(WARNINGS) -o $@ $<

cos_density: $(THERESTOFYOURLIFE_DIR)/cos_density.cc
	$(CXX) $(CXXFLAGS) $(WARNINGS) -o $@ $<

integrate_x_sq: $(THERESTOFYOURLIFE_DIR)/integrate_x_sq.cc
	$(CXX) $(CXXFLAGS) $(WARNINGS) -o $@ $<

pi: $(THERESTOFYOURLIFE_DIR)/pi.cc
	$(CXX) $(CXXFLAGS) $(WARNINGS) -o $@ $<

estimate_halfway: $(THERESTOFYOURLIFE_DIR)/estimate_halfway.cc
	$(CXX) $(CXXFLAGS) $(WARNINGS) -o $@ $<

sphere_importance: $(THERESTOFYOURLIFE_DIR)/sphere_importance.cc
	$(CXX) $(CXXFLAGS) $(WARNINGS) -o $@ $<

sphere_plot: $(THERESTOFYOURLIFE_DIR)/sphere_plot.cc
	$(CXX) $(CXXFLAGS) $(WARNINGS) -o $@ $<

clean:
	rm -f $(EXECUTABLES)
