class Solution {
    fun solution(record: Array<String>): Array<String> {
        val history = arrayListOf<Pair<String, String>>()
        val name = mutableMapOf<String, String>()
        val result = arrayListOf<String>()

        for (e in record.iterator()) {
            val act = e.split(" ")
            when (act[0]) {
                "Enter" -> {
                    name[act[1]] = act[2]
                    history.add(Pair(act[0], act[1]))
                }
                "Leave" -> {
                    history.add(Pair(act[0], act[1]))
                }
                "Change" -> {
                    name[act[1]] = act[2]
                }
            }
        }

        history.map {
            when (it.first) {
                "Enter" -> result.add("${name[it.second]}님이 들어왔습니다.")
                else -> result.add("${name[it.second]}님이 나갔습니다.")
            }
        }

        return result.toTypedArray()
    }
}
