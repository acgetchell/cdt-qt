#include <catch2/catch.hpp>

#include "lib.hpp"

TEST_CASE("Name is cdt-qt", "[library]")
{
  library lib;
  REQUIRE(lib.name == "cdt-qt");
}
