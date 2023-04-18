#include <vector>
#include <hpx/serialization.hpp>

struct serializable {
    int a = 1;
    std::string s = "Hello World!";

    template <typename B>
    void serialize( B& buf ) {
        buf& a;
        buf& s;
    };
};

int main( ) {
    serializable A;
    serializable B;
    A.a = 2;
    A.s = "Always look at the bright side of life ...";
    std::vector<char> buffer;
    auto oarchive = hpx::serialization::output_archive( buffer );
    oarchive << A;
    auto iarchive = hpx::serialization::input_archive( buffer );
    std::cout << B.a << ", " << B.s << std::endl;
    iarchive >> B;
    std::cout << B.a << ", " << B.s << std::endl;

}
